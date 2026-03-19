import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

temperaturas = np.random.randint(20, 36, 7)
print(temperaturas)

dias = ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"]

df = pd.DataFrame({
    "Dia": dias,
    "Temperatura": temperaturas
})

print(df)
print("Média:", df["Temperatura"].mean())
print("Máxima:", df["Temperatura"].max())
print("Mínima:", df["Temperatura"].min())

plt.figure()
plt.plot(df["Dia"], df["Temperatura"], marker='o')

plt.title("Temperatura ao longo da semana")
plt.xlabel("Dias")
plt.ylabel("Temperatura (°C)")

plt.show()

plt.figure()
plt.bar(df["Dia"], df["Temperatura"])

plt.title("Temperatura por dia")
plt.xlabel("Dias")
plt.ylabel("Temperatura (°C)")

plt.show()

plt.figure()
plt.scatter(df["Dia"], df["Temperatura"])

plt.title("Dispersão das temperaturas")
plt.xlabel("Dias")
plt.ylabel("Temperatura (°C)")

plt.show()

