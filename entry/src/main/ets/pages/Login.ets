/*
 * MIT License
 *
 * Copyright (c) 2025 田隆 (Len)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
import { AppStorageV2 } from '@kit.ArkUI';

@Component
struct Login {
  pathStack: NavPathStack = AppStorageV2.connect(NavPathStack, 'layoutNavStack', () => new NavPathStack())!

  build() {
    NavDestination() {
      Column({ space: 10 }) {
        Text('Login')
          .width('100%')

        Row() {
          Text('Username')
            .width('30%')


          TextInput()
            .layoutWeight(1)
        }
        .width('100%')

        Row() {
          Text('Password')
            .width('30%')

          TextInput()
            .layoutWeight(1)
        }
        .width('100%')

        Row() {
          Text('找回密码')
            .decoration({ type: TextDecorationType.Underline })
            .fontColor('#007BFF')
            .onClick(() => {
            })
            .width('30%')
        }
        .width('100%')

        Row() {
          Button('登录')
            .onClick(() => {
              console.log(this.pathStack + "")
              this.pathStack.pushPathByName('Layout', null, false);
            })
            .width('100%')
        }
        .padding({ left: '10%', right: '10%' })
        .width('100%')

        Row() {
          Text('没有账号？去')

          Text('注册账号')
            .decoration({ type: TextDecorationType.Underline })
            .fontColor('#007BFF')
            .onClick(() => {
            })
        }
        .width('100%')

      }
      .height('100%')
      .width('100%')
    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}

@Builder
function LoginBuilder() {
  Login()
}

export { LoginBuilder }

export default LoginBuilder