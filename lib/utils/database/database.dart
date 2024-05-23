const String dataBaseJson = '''
{
    "client": {
        "id": 12981,
        "name": "Gustavo Dias Rocha",
        "account": "",
        "aggency": "",
        "cards": [
            {
                "id": 10971,
                "number": "5360285058807181",

                "limit": "7,867.80",
                "cvc": "192",
                "type": "credit",
                "emiter": "mastercard",
                "bank": "GS3 TEC",
                "bestDay": 10,
                "transactions": [
                    {
                        "id": 1,
                        "name": "Apple",
                        "type": "mobile_buy",
                        "value": "545.99",
                        "date": "2024-05-22T10:30:00",
                        "numberOfInstallments": 12,
                        "hasParcel": true,
                        "valuePerParcel": null
                    },
                    {
                        "id": 2,
                        "name": "Uber",
                        "type": "driver",
                        "value": "35.75",
                        "date": "2024-05-22T15:45:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 3,
                        "name": "Netflix",
                        "type": "mobile_buy",
                        "value": "15.99",
                        "date": "2024-05-20T09:00:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 4,
                        "name": "Google Play",
                        "type": "mobile_buy",
                        "value": "50.00",
                        "date": "2024-05-19T14:20:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 5,
                        "name": "Walmart",
                        "type": "market",
                        "value": "180.99",
                        "date": "2024-05-18T08:45:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 6,
                        "name": "Amazon",
                        "type": "market",
                        "value": "250.00",
                        "date": "2024-05-17T19:30:00",
                        "numberOfInstallments": 5,
                        "hasParcel": true,
                        "valuePerParcel": "50.00"
                    }
                ]
            },
            {
                "id": 10972,
                "number": "4532693544198311",

                "limit": "5,000.00",
                "cvc": "123",
                "type": "credit",
                "emiter": "visa",
                "bank": "Santander",
                "bestDay": 15,
                "transactions": [
                    {
                        "id": 7,
                        "name": "Target",
                        "type": "mobile_buy",
                        "value": "75.50",
                        "date": "2024-05-16T11:10:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 8,
                        "name": "McDonald's",
                        "type": "food",
                        "value": "22.35",
                        "date": "2024-05-15T16:00:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 9,
                        "name": "Home Depot",
                        "type": "market",
                        "value": "150.00",
                        "date": "2024-05-14T09:30:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 10,
                        "name": "Subway",
                        "type": "food",
                        "value": "12.75",
                        "date": "2024-05-13T14:45:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 11,
                        "name": "Gas Station",
                        "type": "market",
                        "value": "40.00",
                        "date": "2024-05-12T08:00:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 12,
                        "name": "Starbucks",
                        "type": "food",
                        "value": "10.25",
                        "date": "2024-05-11T18:20:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    }
                ]
            },
            {
                "id": 10974,
                "number": "6011359992625818",

                "limit": "10,000.00",
                "cvc": "456",
                "type": "credit",
                "emiter": "discover",
                "bank": "Discovery Bank",
                "bestDay": 20,
                "transactions": [
                    {
                        "id": 13,
                        "name": "Best Buy",
                        "type": "mobile_buy",
                        "value": "500.00",
                        "date": "2024-05-10T12:00:00",
                        "numberOfInstallments": 12,
                        "hasParcel": true,
                        "valuePerParcel": "41.67"
                    },
                    {
                        "id": 14,
                        "name": "Costco",
                        "type": "mobile_buy",
                        "value": "300.00",
                        "date": "2024-05-09T17:30:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 15,
                        "name": "Hulu",
                        "type": "mobile_buy",
                        "value": "12.99",
                        "date": "2024-05-08T10:15:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 16,
                        "name": "Gym Membership",
                        "type": "gym",
                        "value": "50.00",
                        "date": "2024-05-07T14:00:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 17,
                        "name": "Restaurant",
                        "type": "food",
                        "value": "75.25",
                        "date": "2024-05-06T07:45:00",
                        "numberOfInstallments": null,
                        "hasParcel": false,
                        "valuePerParcel": null
                    },
                    {
                        "id": 18,
                        "name": "Online Store",
                        "type": "mobile_buy",
                        "value": "120.00",
                        "date": "2024-05-05T20:30:00",
                        "numberOfInstallments": 3,
                        "hasParcel": true,
                        "valuePerParcel": "40.00"
                    }
                ]
            }
        ],
        "favorites": [
          {
            "name": "Cartão Virtual",
            "icon" :  "assets/images/icons/add_card_mail.png"
          },
          {
            "name": "Cartão Adicional",
            "icon" :  "assets/images/icons/add_card_rounded.png"
          },
          {
            "name": "Seguros",
            "icon" :  "assets/images/icons/shield_outlined.png"
          },
          {
            "name": "Pacote SMS",
            "icon" :  "assets/images/icons/mail_outline_rounded.png"
          }
        ]

    }
}''';
