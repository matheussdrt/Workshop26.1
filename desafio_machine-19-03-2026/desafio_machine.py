import pandas as pd

from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import OneHotEncoder
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score, classification_report, confusion_matrix

df = pd.read_csv("bmw_global_sales_dataset.csv")

print("PRIMEIRAS LINHAS:")
print(df.head(10))
print()

print("INFORMAÇÕES DO DATASET:")
df.info()
print()

print("VALORES NULOS POR COLUNA:")
print(df.isnull().sum())
print()

print("DISTRIBUIÇÃO DA COLUNA engine_type:")
print(df["engine_type"].value_counts())
print()

mediana_vendas = df["units_sold"].median()
df["high_sales"] = (df["units_sold"] >= mediana_vendas).astype(int)

print("MEDIANA DE units_sold:", mediana_vendas)
print()
print("DISTRIBUIÇÃO DA VARIÁVEL ALVO:")
print(df["high_sales"].value_counts())
print()

X = df.drop(columns=["units_sold", "high_sales"])
y = df["high_sales"]

colunas_categoricas = X.select_dtypes(include=["object"]).columns
colunas_numericas = X.select_dtypes(exclude=["object"]).columns

preprocessamento = ColumnTransformer(
    transformers=[
        (
            "num",
            Pipeline(
                steps=[
                    ("imputer", SimpleImputer(strategy="median"))
                ]
            ),
            colunas_numericas
        ),
        (
            "cat",
            Pipeline(
                steps=[
                    ("imputer", SimpleImputer(strategy="most_frequent")),
                    ("onehot", OneHotEncoder(handle_unknown="ignore"))
                ]
            ),
            colunas_categoricas
        )
    ]
)

X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42,
    stratify=y
)

modelo = Pipeline(
    steps=[
        ("preprocessamento", preprocessamento),
        ("classificador", DecisionTreeClassifier(max_depth=5, random_state=42))
    ]
)

modelo.fit(X_train, y_train)

y_pred = modelo.predict(X_test)

acuracia = accuracy_score(y_test, y_pred)

print("ACURÁCIA DO MODELO:")
print(f"{acuracia * 100:.2f}%")
print()

print("MATRIZ DE CONFUSÃO:")
print(confusion_matrix(y_test, y_pred))
print()

print("RELATÓRIO DE CLASSIFICAÇÃO:")
print(classification_report(y_test, y_pred))

print("ANÁLISE DO PROBLEMA:")
print("Objetivo do modelo: prever se a quantidade de vendas será alta ou baixa.")
print("Tipo de problema: classificação binária.")
print("Desafios identificados: não há valores nulos relevantes no dataset e a variável alvo ficou bem distribuída após a criação da classe high_sales.")
print("Fonte dos dados: arquivo CSV.")
