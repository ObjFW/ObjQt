/*
 * Copyright (c) 2017, Jonathan Schleifer <js@heap.zone>
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

#import "OFString+QString.h"

@implementation OFString (QString)
+ stringWithQString: (const QString &)qString
{
	return [[[self alloc] initWithQString: qString] autorelease];
}

- initWithQString: (const QString &)qString
{
	static_assert(sizeof(QChar) == sizeof(char16_t),
	    "QChar and char16_t have a different size!");

	return [self initWithUTF16String: (char16_t *)qString.data()
				  length: qString.length()];
}

- (QString)qString
{
	static_assert(sizeof(char16_t) == sizeof(QChar),
	    "char16_t and QChar have a different size!");

	void *pool = objc_autoreleasePoolPush();
	QString ret = QString((QChar *)[self UTF16String]);

	objc_autoreleasePoolPop(pool);

	return ret;
}
@end
