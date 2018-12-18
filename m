Return-Path: <ranshalit@gmail.com>
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7CF6C0DB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 17:33:17 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id q1so9935668qkf.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 09:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=EG88HiSmlu57cs2qxdSQyu900haWg+wHk0rFmWbjLZ8=;
	b=un8kaqBlyEAcwJavhExGZzSaPxSmYlCIommi2gJRlj3q862vpNV8HOY2n46Q+xnd/Z
	HkMJwEdg3ePV48cK+haDio9b2+4puqof3KXWKLhli92CFdk4IbICeQvQLWa6HEYTKk/U
	A1fHrDBBmEZOnrRqAqVeihL/W/qxc55LMN0XQ8QMnAYsIHwdxnAP1MiS7jSMmKI2cDA3
	w3zEaK9U9K7e2OtK6+2QWtjddb3vieG3txXPN5YO9mpVWJKKLt4Av8Dp4e4IL40cj//7
	6bbxiAoKXXOavgYBdtAdag8wWiWANDetRUkqF0oe3AUCQkG7AetweIN1wgWVqiiEPTam
	rnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=EG88HiSmlu57cs2qxdSQyu900haWg+wHk0rFmWbjLZ8=;
	b=SnmqcIyqqbwGY3ep4OUUsQjO07eP9XHbxGe1x4NtP5xqbNV23ZrA3ZGmVn0ienJUDH
	fniubRFV3BogVH9U6jBsUwWEoE6/D6v1sZ8SoYSBDHRawAIYZ3gdmHAzheCkoeh03eOC
	+1liJDCcz+XVSNoxmvRNl/c/sIhvF6mQ1ECs8c2u5HpRx3H1CeBnpihKVmkt/Kn3qODR
	YgWTvBGtNnAxLNZ7A0LZlfnLCDJBfrRkI5hpsXhQgc1Lo6sGs8ErIdZuy3JN3spqBuuQ
	bhLI8zIcnFmpj/g2kP+mo/I17OtDUl4jp77J/QQW4pDJvaKm0gtK4jU6axqlQcxpUiP9
	IiPA==
X-Gm-Message-State: AA+aEWbFF9cWYYrRhp8+sutL5onVLwAhUJdymD3hcCnujDVIbZkOAUkh
	gtcGtOM10OtnFI2E1xxmOuywjwJ9CzWb9xwamAZY8pFC
X-Google-Smtp-Source: AFSGD/XLirwwRtpMFoVxScSw4zaGzpEUA9n8EJddbTPSkpnUhIdgCe8SV/vStqar4Vrk1TXNcdFlVxYQtfr1TuPR8yw=
X-Received: by 2002:a37:8307:: with SMTP id f7mr16578090qkd.4.1545154398469;
	Tue, 18 Dec 2018 09:33:18 -0800 (PST)
MIME-Version: 1.0
From: Ranran <ranshalit@gmail.com>
Date: Tue, 18 Dec 2018 19:33:08 +0200
Message-ID: <CAJ2oMhKO6cTvx4DA8y0xJ-Gq7RR2mEG0qy_Uctrm45wqzvHRMw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: static build of Qt
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2018 17:33:18 -0000
Content-Type: text/plain; charset="UTF-8"

 Hello,

 Is it possible to make a static build of Qt ?
 Or does it have to be manually done as shown here:
 https://doc.qt.io/QtForDeviceCreation/qtee-static-linking.html
 If it has to be done manually as above, should I replace rootfs libraries ?

Thank you,
ran

