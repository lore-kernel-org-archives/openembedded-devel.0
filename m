Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rps26-00039w-6M
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 02:52:18 +0100
Received: by lags15 with SMTP id s15so2724479lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jan 2012 17:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kQUvPIFado0m9hsz33jf3TrdyiTghyPvApicQ5BuQtA=;
	b=c0FdfnB2haDO9ywzCZ+9qA7YSoFDpldTrgOZLS+x8BF7ULCCEi5GYv5jNsXLcROgge
	ns3U0cFuBOlKYlzxQcv2EiuMET+zHW3mYdv/IdagZXA7s8ZqHgbZ4Tkj80r126j4sS1X
	ARhCxwbbtf66jQQfWjgqw0XXrfS1zOZInRbnU=
Received: by 10.112.86.67 with SMTP id n3mr3859324lbz.29.1327455872229; Tue,
	24 Jan 2012 17:44:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 24 Jan 2012 17:44:01 -0800 (PST)
In-Reply-To: <1327449958-9778-2-git-send-email-andrea.adami@gmail.com>
References: <1327449958-9778-1-git-send-email-andrea.adami@gmail.com>
	<1327449958-9778-2-git-send-email-andrea.adami@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jan 2012 17:44:01 -0800
Message-ID: <CAMKF1sor3Gq4VRmiyWKbwJ8J=bcHQq+oOJH3H5a=SAcLAzE1iQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] udev: default disabling DEVCACHE
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
X-List-Received-Date: Wed, 25 Jan 2012 01:52:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 24, 2012 at 4:05 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> * Ininfluent when using systemd.

Did you mean inefficient ?


