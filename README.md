# Pikuma's 2D Game Engine Course

This is just me following along [Pikuma's 2D game engine development course](https://pikuma.com/courses/cpp-2d-game-engine-development).

## Setup

### Linux

> [!NOTE]
> I've tried this on Debian 12.

#### Build tooling

```
sudo apt install build-essential
```

#### SDL2 and friends

```
sudo apt install libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libsdl2-mixer-dev
```

For Lua:

```
sudo apt install liblua5.4-dev
```

### macOS

> [!NOTE]
> I've tried this on macOS 15 (Sequoia).

#### Build tooling

```
xcode-select --install
```

#### SDL2 and friends

```
brew install sdl2 sdl2_image sdl2_ttf sdl2_mixer
```

#### Lua

```
brew install lua@5.4
```

## Run

```
make run
```
