/*
 * Copyright (c) 2018, Jonathan Schleifer <js@heap.zone>
 *
 * https://heap.zone/git/objqt.git
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice is present in all copies.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#import "OFColor+QColor.h"

@implementation OFColor (QColor)
+ (instancetype)colorWithQColor: (const QColor &)qColor
{
	return [[[self alloc] initWithQColor: qColor] autorelease];
}

- (instancetype)initWithQColor: (const QColor &)qColor
{
	return [self initWithRed: qColor.redF()
			   green: qColor.greenF()
			    blue: qColor.blueF()
			   alpha: qColor.alphaF()];
}

- (QColor)qColor
{
	QColor qColor;
	float red, green, blue, alpha;

	[self getRed: &red
	       green: &green
		blue: &blue
	       alpha: &alpha];

	qColor.setRedF(red);
	qColor.setGreenF(green);
	qColor.setBlueF(blue);
	qColor.setAlphaF(alpha);

	return qColor;
}
@end
