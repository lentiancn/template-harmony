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
import LayoutItem from '../models/LayoutItem'
import iconTextBuilder from '../utils/IconTextBuilder'
import Home from './LayoutHome'
import Me from './LayoutMe'

@Component
struct Layout {
  pathStack: NavPathStack = new NavPathStack()
  items: LayoutItem[] = [
    {
      name: "首页",
      icon: $r("app.media.icon")
    },
    {
      name: "我的",
      icon: $r("app.media.icon")
    }
  ]

  @Builder
  TabContentBuilder(item: LayoutItem, index: number) {
    TabContent() {
      if (item.name === '首页') {
        Home()
      } else if (item.name === '我的') {
        Me()
      }
    }
    .backgroundColor('#131215')
    .tabBar(iconTextBuilder(item.icon, item.name, 10))
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }

  build() {
    NavDestination() {
      Tabs({ barPosition: BarPosition.End }) {

        ForEach(this.items, (item: LayoutItem, index: number) => {
          this.TabContentBuilder(item, index);
        })

      }
      .backgroundColor('#cccccc')
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])

    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}

@Builder
function LayoutBuilder() {
  Layout()
}

export { LayoutBuilder }

export default LayoutBuilder