/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2026 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32h5xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define GPIO0_Pin GPIO_PIN_13
#define GPIO0_GPIO_Port GPIOC
#define GPIO1_Pin GPIO_PIN_14
#define GPIO1_GPIO_Port GPIOC
#define GPIO2_Pin GPIO_PIN_15
#define GPIO2_GPIO_Port GPIOC
#define GPIO3_Pin GPIO_PIN_0
#define GPIO3_GPIO_Port GPIOC
#define GPIO4_Pin GPIO_PIN_2
#define GPIO4_GPIO_Port GPIOC
#define GPIO5_Pin GPIO_PIN_3
#define GPIO5_GPIO_Port GPIOC
#define GPIO9_Pin GPIO_PIN_3
#define GPIO9_GPIO_Port GPIOA
#define GPIO7_Pin GPIO_PIN_0
#define GPIO7_GPIO_Port GPIOB
#define SD_CD_Pin GPIO_PIN_1
#define SD_CD_GPIO_Port GPIOB
#define GPIO6_Pin GPIO_PIN_6
#define GPIO6_GPIO_Port GPIOC
#define LED1_Pin GPIO_PIN_7
#define LED1_GPIO_Port GPIOC
#define LED2_Pin GPIO_PIN_8
#define LED2_GPIO_Port GPIOC
#define SDA_2_Pin GPIO_PIN_9
#define SDA_2_GPIO_Port GPIOC
#define SCL_2_Pin GPIO_PIN_8
#define SCL_2_GPIO_Port GPIOA
#define GPS_INT_Pin GPIO_PIN_11
#define GPS_INT_GPIO_Port GPIOC
#define GPS_TIME_Pin GPIO_PIN_2
#define GPS_TIME_GPIO_Port GPIOD
#define GPIO8_Pin GPIO_PIN_5
#define GPIO8_GPIO_Port GPIOB
#define SCL_1_Pin GPIO_PIN_6
#define SCL_1_GPIO_Port GPIOB
#define SDA_1_Pin GPIO_PIN_7
#define SDA_1_GPIO_Port GPIOB

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
