package com.tjitcast.mark;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;

import javax.imageio.ImageIO;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class WaterMark {
	public WaterMark() {

	}

	/** */
	/**
	 * ��ͼƬӡˢ��ͼƬ��
	 * 
	 * @param pressImg --
	 *            ˮӡ�ļ�
	 * @param targetImg --
	 *            Ŀ���ļ�
	 * @param x
	 * @param y
	 */
	public final static void pressImage(String pressImg, String targetImg,
			int x, int y) {
		try {
			File _file = new File(targetImg);
			Image src = ImageIO.read(_file);
			int wideth = src.getWidth(null);
			int height = src.getHeight(null);
			BufferedImage image = new BufferedImage(wideth, height,
					BufferedImage.TYPE_INT_RGB);
			Graphics g = image.createGraphics();
			g.drawImage(src, 0, 0, wideth, height, null);

			//ˮӡ�ļ�
			File _filebiao = new File(pressImg);
			//����һ��Image������ԴͼƬ���������
			Image src_biao = ImageIO.read(_filebiao);
			int wideth_biao = src_biao.getWidth(null);
			int height_biao = src_biao.getHeight(null);
			g.drawImage(src_biao, wideth - wideth_biao - x, height
					- height_biao - y, wideth_biao, height_biao, null);
			g.dispose();
			FileOutputStream out = new FileOutputStream(targetImg);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(image);
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/** */
	/**
	 * ��ӡ����ˮӡͼƬ
	 * 
	 * @param pressText
	 *            --����
	 * @param targetImg --
	 *            Ŀ��ͼƬ
	 * @param fontName --
	 *            ������
	 * @param fontStyle --
	 *            ������ʽ
	 * @param color --
	 *            ������ɫ
	 * @param fontSize --
	 *            �����С
	 * @param x --
	 *            ƫ����
	 * @param y
	 */

	public static void pressText(String pressText, String targetImg,
			String fontName, int fontStyle, int color, int fontSize, int x,
			int y) {
		try {
			File _file = new File(targetImg);
			Image src = ImageIO.read(_file);
			int wideth = src.getWidth(null);
			int height = src.getHeight(null);
			BufferedImage image = new BufferedImage(wideth, height,
					BufferedImage.TYPE_INT_RGB);
			Graphics g = image.createGraphics();
			g.drawImage(src, 0, 0, wideth, height, null);
			g.setColor(Color.YELLOW);
			g.setFont(new Font(fontName, fontStyle, fontSize));
			g.drawString(pressText, wideth - fontSize - x, height - fontSize
					/ 2 - y);
			g.dispose();
			FileOutputStream out = new FileOutputStream(targetImg);
			JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
			encoder.encode(image);
			out.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static void main(String[] args) {
		//�ѵ�һ��ͼƬ���ڵڶ���ͼƬ֮��
		  pressImage("xmh.jpg", "jsf.jpg", 352 ,46);
		//pressText("��ĺ�����", "xmh.jpg", "����", Font.BOLD, 0, 20, 200, 200);
	}
}
