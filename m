Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TvXWx-0001Zr-Pf
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jan 2013 19:16:08 +0100
Received: from mail-qc0-f197.google.com ([209.85.216.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 16 Jan 2013 10:00:44 -0800
Received: by mail-qc0-f197.google.com with SMTP id x40so2367956qcs.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jan 2013 10:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=I6aEZ9H6QcBHP0OyDORhEodQW8Q0hfekWphHneN4X1Q=;
	b=HtPhN4luZGGBMYyYcYuJ/sUrxpBZEftdFRfLmphMiuDv+VNW3H82N/gHpdCPEluv4R
	UZM2YMiVRZD95UEm8l7Rj0AuEUuTP7ICpmwDPhD3kPkY/ODRPsGIV1g/HCw49CeBli/6
	d6WRe9IbTIUi0FhmLEn+hpZKMV1DAi0xhcUyx19qV9QzCwsJKU0AHtaNC2qU1vtZPA3r
	THUsP6fLEEEOYqveZ+ed2I6dGxuyf3nQLR/KU0NVSHSjaN7f3PYMezduRNBRdoEANKWc
	Yul1X5cMbjWjBS6zOSQRubaSSnO3SsRS5ZX9heUzPd+MaTAn3hXw6KNYjTyp2JpWzsg3
	UnkA==
X-Received: by 10.220.107.5 with SMTP id z5mr2260447vco.22.1358359243526;
	Wed, 16 Jan 2013 10:00:43 -0800 (PST)
X-Received: by 10.220.107.5 with SMTP id z5mr2260433vco.22.1358359243415; Wed,
	16 Jan 2013 10:00:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Wed, 16 Jan 2013 10:00:23 -0800 (PST)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jan 2013 18:00:23 +0000
Message-ID: <CAJTo0LZAJiyCHX6f_G5SuLmtZdq=oFc2WY=Ohoc+p3cBgMq8WA@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnO++WzyskyueMOxLy/GTFJib0Xih1aVYv3YS8SanULj4dCoP2k4isSGzs9X86iQf+DIWUjNLtGZ3JNlXxoqJtuwdHKWzo/ytjVfVma7FOutWIpquGxs9d0mQmmyJZB1W6QWqqsH7+Lez/HSvP4+OV89lZpHQTifLCRz6Vv5+Qy6+YKZV0NtkihdlbiHsygUfMrrTmp
Subject: Wayland
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 18:16:09 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

Just in case anyone is interested and not already on oe-core, I just
posted a patch series to add Wayland and Weston.  Feedback welcome.

Ross


