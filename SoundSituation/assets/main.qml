/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import bb.multimedia 1.0

import "randomSound.js" as RandomSound

Page {
    
    /*Menu.definition: MenuDefinition{
        helpAction: HelpActionItem {
            
        }
    }*/
	
    Container {
        background: backgroundPaint.imagePaint
        layout: AbsoluteLayout {}
        
        /*
         *
         * De aqui hasta el siguiente bloque de comentario es la colocacion
         * de las imagenes y su respectiva logica
         * 
         */
        
        ImageView {
            id: law
            accessibility.name: "law"
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 150
                positionY: 250
            }
            imageSource: "asset:///images/icono1.png";
            onTouch: {
                console.log("presionando");
                lawAdnOrder.play();
            }
        }
        ImageView {
            id: badum
            accessibility.name: "badum"
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 490
                positionY: 250
            }
            imageSource: "asset:///images/icono2.png";
            onTouch: {
                console.log("presionando");
                badumtss.play();
            }
        }
        
        ImageView {
            id:troll
            accessibility.name: "troll"
            imageSource: "asset:///images/trollface.png"
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 240
                positionY: 500
            }
            animations: [
                ScaleTransition {
                    id: trollScale
                    toX: 2.0
                    toY: 2.0
                    duration: trollSound.duration / 2
                },
                ScaleTransition {
                    id: trollUnscale
                    toX: 1.0
                    toY: 1.0
                    duration: trollSound.duration / 2
                }
            ]
            onTouch: {
                var source = RandomSound.recurso();
                var sonido = "asset:///sounds/"+source;
                trollSound.sourceUrl = sonido;
                trollSound.play();
            }
        }
        
        ImageView {
            id: aplausoImg
            accessibility.name: "aplausoImg"
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 150
                positionY: 902
            }
            imageSource: "asset:///images/icono3.png";
            onTouch: {
                console.log("presionando");
                aplauso.play();
            }
        }
        
        ImageView {
            id: wrongImg
            accessibility.name: "wrongImg"
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 490
                positionY: 902
            }
            imageSource: "asset:///images/icono4.png";
            onTouch: {
                console.log("presionando");
                wrong.play();
            }
        }
        
        /*
         *
         *Aqui terminan las imagenes y empiezan los textos de la app 
         * 
         */
        
        Label {
            id: lawLb
            text: qsTr("Law & Order")
            textStyle.color: Color.White
            textStyle.base: flouxetine.style
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 130
                positionY: 400
            }
        }
        Label {
            id: badumLb
            text: qsTr("Ba dum tss!")
            textStyle.color: Color.White
            textStyle.base: flouxetine.style
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 475
                positionY: 400
            }
        }
        Label {
            id: clappinLb
            text: qsTr("Clapping")
            textStyle.color: Color.White
            textStyle.base: flouxetine.style
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 155
                positionY: 1050
            }
        }
        Label {
            id: wrongLb
            text: qsTr("Wrong")
            textStyle.color: Color.White
            textStyle.base: flouxetine.style
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 513
                positionY: 1050
            }
        }
        Label {
            id: title
            text: qsTr("TROLL Sound")
            textStyle.color: Color.White
            textStyle.base: flouxetine.style
            textStyle.fontSize: FontSize.XXLarge
            layoutProperties: AbsoluteLayoutProperties {
                positionX: 200
                positionY: 50
            }
            rotationZ: -5
        }        
        
    }
    
    
    /*Aca estan los sonidos y demas cosillas como el background  */
    attachedObjects: [
       MediaPlayer{
           id:lawAdnOrder
           sourceUrl: "asset:///sounds/doink_doink.mp3"
           onBufferStatusChanged: {
               console.debug("dime el bufferstatus "+lawAdnOrder.bufferStatus);
               var status = lawAdnOrder.bufferStatus;
               if(status == 2){
                   law.imageSource = "asset:///images/icono1b.png";
               }
               if(status == 0){
                   law.imageSource = "asset:///images/icono1.png"
               }
           }
       },
       MediaPlayer {
           id:badumtss
           sourceUrl: "asset:///sounds/BaDumTss.mp3"
           onBufferStatusChanged: {
               console.debug("dime el bufferstatus "+badumtss.bufferStatus);
               var status = badumtss.bufferStatus;
               if(status == 2){
                   badum.imageSource = "asset:///images/icono2b.png";
               }
               if(status == 0){
                   badum.imageSource = "asset:///images/icono2.png"
               }
           }
       },
       MediaPlayer {
           id:aplauso
           sourceUrl: "asset:///sounds/aplausos.wav"
           onBufferStatusChanged: {
               console.debug("dime el bufferstatus "+aplauso.bufferStatus);
               var status = aplauso.bufferStatus;
               if(status == 2){
                   aplausoImg.imageSource = "asset:///images/icono3b.png";
               }
               if(status == 0){
                   aplausoImg.imageSource = "asset:///images/icono3.png";
               }
           }  
         },
       MediaPlayer {
           id:wrong
           sourceUrl: "asset:///sounds/wrong.wav"
           onBufferStatusChanged: {
               console.debug("dime el bufferstatus "+wrong.bufferStatus);
               var status = wrong.bufferStatus;
               if(status == 2){
                   wrongImg.imageSource = "asset:///images/icono4b.png";
               }
               if(status == 0){
                   wrongImg.imageSource = "asset:///images/icono4.png";
               }
           }  
       },
       MediaPlayer {
           id: trollSound
           onBufferStatusChanged: {
               var status = trollSound.bufferStatus;
               if(status == 2){
               		trollScale.play();
               }
               if(status == 0){
               		trollUnscale.play();
               }
           }
       },
       ImagePaintDefinition {
           id: backgroundPaint
           imageSource: "asset:///images/backgroundBlack.jpg"//"asset:///images/background.amd"
           repeatPattern: RepeatPattern.XY
       },
       TextStyleDefinition {
           id: flouxetine
           base: SystemDefaults.TextStyles.BodyText
           rules: [
               FontFaceRule {
                   source: "asset:///fluoxetine/Fluox___.ttf"
                   fontFamily: "flouxetineFont"
               }
           ]
           fontFamily: "flouxetineFont, sans-serif"
       }
    ]
    
    
}
