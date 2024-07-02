import 'package:flutter/painting.dart';

/// Кастомный минимальный размер интерактивного элемента.
const double kCustomMinInteractiveDimension = 50.0;

/// Кастомная высота панели инструментов AppBar.
const double kCustomToolbarHeight = 105.0;

/// Кастомная высота нижней навигационной панели.
const double kCustomBottomNavigationBarHeight = 70.0;

/// Кастомная высота таб-бара с текстом.
const double kCustomTextTabBarHeight = kCustomMinInteractiveDimension;

/// Кастомное время для анимации смены темы.
const Duration kCustomThemeChangeDuration = Duration(milliseconds: 250);

/// Кастомный радиус круговой реакции материала в логических пикселях.
const double kCustomRadialReactionRadius = 22.0;

/// Кастомное время для расширения круговой реакции материала до полного размера.
const Duration kCustomRadialReactionDuration = Duration(milliseconds: 120);

/// Значение альфа-канала для рисования круговой реакции материала.
const int kCustomRadialReactionAlpha = 0x2F;

/// Длительность горизонтальной прокрутки анимации при нажатии на вкладку.
const Duration kCustomTabScrollDuration = Duration(milliseconds: 350);

/// Горизонтальный отступ, включенный вкладками.
const EdgeInsets kCustomTabLabelPadding = EdgeInsets.symmetric(horizontal: 18.0);

/// Отступ, добавляемый вокруг элементов списка материала.
const EdgeInsets kCustomMaterialListPadding = EdgeInsets.symmetric(vertical: 10.0);

/// Кастомный цвет иконок для светлой темы.
const Color kCustomDefaultIconLightColor = Color(0xFFFFFFFF);

/// Кастомный цвет иконок для темной темы.
const Color kCustomDefaultIconDarkColor = Color(0xFF000000);
