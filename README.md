# libca-em [![CI](https://github.com/luiox/libca-em/actions/workflows/ci.yml/badge.svg)](https://github.com/luiox/libca-em/actions/workflows/ci.yml) [![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](LICENSE)

纯 C（C99）嵌入式组件库：外设/传感器驱动、总线抽象、XMODEM/YMODEM 协议栈、交互式 shell、日志、内存池、软定时器、OTA。以 xmake 源码包方式注入宿主工程，不产出独立库文件。

## 特性

* **28 个外设/传感器驱动**：DHT11、W25QXX、BME280、JY61P 等，数据驱动清单（`src/em_driver/`），板级 port 可注入
* **传输协议栈**：XMODEM / YMODEM，配套 dstream 数据流抽象
* **交互式 shell**：命令注册、参数解析，易于挂载调试命令
* **基础设施**：CRC（MODBUS/XMODEM/IEEE）、软定时器、内存池、调试打印、日志
* **std/custom 双实现**：string_util/memory_util 等可按模块配置切换
* **62 个主机可跑单测**，CI 覆盖 Linux + Windows；MCU 交叉编译由消费工程验证

## 使用

### 接入宿主工程

xmake ≥ 2.8.3。模块以源码注入方式编译进宿主 target：

```lua
add_moduledirs("<libca-em 路径>/xmake/modules")

target("app")
    set_kind("binary")
    on_load(function (target)
        local em = import("libca.em")
        em.setup(target, { root = "<libca-em 路径>" })
        em.add_libs(target, "em_base", "em_util")
    end)
```

* `em.add_libs` 接受单个模块名或带配置的表，模块依赖自动按声明顺序展开；
* 驱动以数据驱动清单声明，板级 port 文件经 `port` 配置传入绝对路径；
* `em_eimui`（SDL UI）不接入源码包管理器，需要时在宿主工程手动接入；
* 机制规范见 [doc/源码包规范.md](doc/%E6%BA%90%E7%A0%81%E5%8C%85%E8%A7%84%E8%8C%83.md)。

### 构建与单测（本仓库开发）

```sh
xmake f -y
xmake -y
xmake test        # 62 项单测（em_test 规则自动注册）

xmake f --with_demo=y -y && xmake -y && xmake run demo_led_extern   # demo（需 arm-none-eabi）
```

## 说明

* 本库**由 AI 生成**，优先服务于作者个人项目；pre-1.0 阶段无 API 兼容性与可用性保证，生产使用请自行评估（免责条款见 [LICENSE](LICENSE)）。
* Issue 欢迎提：作者会安排 AI 分诊处理，但不承诺时效。

## License

[Apache-2.0](LICENSE) © Canrad
