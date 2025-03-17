import { Controller } from "@hotwired/stimulus"
import ApexCharts from "apexcharts";

export default class extends Controller {
    static targets = ["chart", "time", "temperature", "concentration"];

    connect() {
        console.log(this.generateChartData());
        this.renderChart();
    }

    renderChart() {
        const options = {
            chart: {
                type: "line",
                height: 400,
                width: "100%", // Garante que o gráfico expanda conforme necessário
                zoom: {
                    enabled: true // Permite zoom para visualizar melhor os dados
                },
                scrollablePlotArea: {
                    enabled: true, // Habilita rolagem horizontal
                    scrollHorizontal: true
                }
            },
            series: [
                {
                    name: 'Temperatura',
                    data: JSON.parse(this.concentrationTarget.value)
                }
            ],
            xaxis: {
                categories: this.generateChartData(),
                type: 'datetime',
                tickAmount: 24,
                labels: {
                    format: 'HH:mm',
                    rotate: -45
                },
                title: {
                    text: 'Horário'
                }
            },
            yaxis: {
                title: {
                    text: 'Quantidade'
                }
            }
        };

        new ApexCharts(this.chartTarget, options).render();
    }

     generateChartData() {
        let data = [];

        data = JSON.parse(this.timeTarget.value).map((item) => {
            let hour = parseInt(item.split(":")[0]);
            let minute = parseInt(item.split(":")[1]);
            let second = parseInt(item.split(":")[2]);

            let newHour = new Date();
            let time = newHour.setHours(hour, minute, second, 0);

            return time
        });

        return data;
    }
}