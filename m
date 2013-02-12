Received: from mail-vb0-f48.google.com ([209.85.212.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U5OBk-0006Lo-2C
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Feb 2013 23:19:07 +0100
Received: by mail-vb0-f48.google.com with SMTP id fc21so366064vbb.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Feb 2013 14:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=iR16lmyf9WassoQbIi3Pq6wnmKt0wzk+1wcbz4ZTjCw=;
	b=NipcSY+U7Fq0a+0bZV+v2j/DLzxwTWydPomgnwiiXY27aJxARBG1DQWcy90X+naNaZ
	MYY+6OekZhTXBJu70ji8DlehIN3jmwbFGv60UAVj8FHlgoyhbQgXNxv1sMvTtRMsfxI1
	Hq6JyziCOU5/V853BVTYxNDFxMarjWlLR9Qtmudghx52Q5kwt9qb/3eoZwEF/a5jE3AR
	83m+sFCai9ayhdfO4VeS4mem/ouWINrIhE0GcsmfPLTdXHG0bwla4/vseH/MmQzyYUP2
	psTnz62d37qqbmws1TnvpZn0hCPnqFiBOlUTFPL3qNYeGIpJYjQ5wJZq+TPylMteeENo
	eL1w==
X-Received: by 10.58.106.161 with SMTP id gv1mr26111267veb.35.1360706575716;
	Tue, 12 Feb 2013 14:02:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Tue, 12 Feb 2013 14:02:35 -0800 (PST)
In-Reply-To: <20130212225303.029a2ac9@e6520eb>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
	<1906630.s5um26QAQj@helios>
	<CAP9ODKrOM9bh-MnzQvU29iVwYdRvw4m7DMYZUcMV=wKYJ5Q4bg@mail.gmail.com>
	<CAJTo0LYFcT5P=p62Nn2kBak33LCfBXQ_KFL-oF2bHFKhguk1rg@mail.gmail.com>
	<20130212212255.GF3300@jama>
	<CAJTo0LZREeVX7cWLttEvzxSK_VMNPQyZuQqReEMTH-zbHObdLw@mail.gmail.com>
	<20130212225303.029a2ac9@e6520eb>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Feb 2013 22:02:35 +0000
Message-ID: <CAJTo0LapvdGaYUu2J9h+=MBJKc7fkfbKc-55oOOgF7+x17sT5g@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQnwvj1Qhl8Y9AXyheWqsJCTG1crgPUN+uE4ixCj9Ox3gXExZ/l+Vt7s7qDDA5nRvNsS4o18
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [OE-core] RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 22:19:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 12 February 2013 21:53, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> if you have a how-to to get Qt/E 4.x working with evdev, please send it
> before removing tslib so that we can test it on several boards which
> are actually running with Qt/E+tslib.

Totally, not regressing badly is a prerequisite.

Ross


