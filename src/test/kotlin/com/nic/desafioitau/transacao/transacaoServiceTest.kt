package com.nic.desafioitau.transacao

import org.springframework.boot.test.context.SpringBootTest
import kotlin.test.Test

@SpringBootTest
class transacaoServiceTest {

    private val service = TransacaoService()

    @Test
    fun `transacao must have valid data`() {
        val transacao = Transacao(valor = 10.0)

    }

    @Test
    fun `transacao don't happen in future`() {
        val transacao =

    }

    @Test
    fun `transacao are equal or more than zero`() {

    }
}

//Tenham os campos valor e dataHora preenchidos
//A transação NÃO DEVE acontecer no futuro
//A transação DEVE ter acontecido a qualquer momento no passado
//A transação NÃO DEVE ter valor negativo
//A transação DEVE ter valor igual ou maior que 0 (zero)