Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T14z3-0000r3-1N
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 02:27:45 +0200
Received: by eekb57 with SMTP id b57so936935eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=H+eDE4nNwy504S9enbYj8l4HauSBAOZwBV68/6xnsUA=;
	b=w0p/kUDf5dksCi1BtTG01DLbbrUeRSw5ITS+pb99NMHrZXtajwVlmVdBMoPQmJkdDw
	QzlA6N6tA+mYCCvJe2PPJvWbSxdu0KUfwxV63K3NaJlt8w9moUuTu8DaiU2kIiinbLkb
	FRslj5WDAs0rIjnQbiq+3DyolyuZUl6Nwr76rXhuPaR5pR+I17rqFTlbtRmZjAYn6/f+
	C+FbYNJj4fwQJw95qjMiGycYBThPewBqYO1zrhkxng3ceXdNrl8BmGlqrHTo32ZTQGNa
	4yEeOsvZOxtAZWvSBEPnSE/ctXCZI4glqzKZVSexjfa7kqI1SBDVYudLm8SvdJupTCaK
	40oQ==
MIME-Version: 1.0
Received: by 10.14.203.69 with SMTP id e45mr16536353eeo.23.1344903350977; Mon,
	13 Aug 2012 17:15:50 -0700 (PDT)
Received: by 10.14.225.6 with HTTP; Mon, 13 Aug 2012 17:15:50 -0700 (PDT)
In-Reply-To: <B39AAE57-63B2-4EFA-A037-4F225E1CB21B@gmail.com>
References: <B39AAE57-63B2-4EFA-A037-4F225E1CB21B@gmail.com>
Date: Mon, 13 Aug 2012 17:15:50 -0700
Message-ID: <CAMKF1sqqVTdy4ZT8p-Z7n=KjpSos1xBOKr6Y_7NFiQ=X7E7ybg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded/toolchain-layer] Adding retired toolchain support for gcc-4.5.1 and eglibc-2.13
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
X-List-Received-Date: Tue, 14 Aug 2012 00:27:45 -0000
Content-Type: text/plain; charset=UTF-8

Were you able to build eglibc 2.13 with gcc 4.7
And run it


On Monday, August 13, 2012, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> Hi,
>       I've created a set of patches to add retired toolchain support for
gcc-4.5.1, to the meta-openembedded/toolchain-layer.
>
> I've also included a patch for eglibc-2.13. Builds for PowerPC 440
processors soft-float don't work with eglibc-2.15 and 2.16.
>
> I could add it to the meta-xilinx layer, but I prefer to put retired
toolchain support into the toolchain layer, so that it is generally
available across all layers, in case someone needs it.
>
> Do let me know if it is okay to go ahead and submit these patches for
inclusion into the meta-openembedded/toolchain-layer!
>
> Best regards,
>
> Elvis Dowson

