package com.nic.desafioitau.transacao

import org.jetbrains.annotations.NotNull
import org.springframework.data.annotation.Id
import org.springframework.data.mongodb.core.mapping.Document
import java.time.OffsetDateTime

@Document(collection = "transacoes")
data class Transacao (
    @Id
    val id: String? = null,
    val valor: Double,
    val dataHora: OffsetDateTime
)