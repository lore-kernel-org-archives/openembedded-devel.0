Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TLqC7-0001FD-Qe
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Oct 2012 08:55:03 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so65742bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2012 23:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=QBNH2f6w4FXeSjmt+JPYPKhH3qojuvAeKC1dMkkJ+Ao=;
	b=UMhV7oRV2S/mXe+JH++LFAYEo5MkFgumasej7kMLkhNgMZQdMuVJupMJSEcgeUii0U
	JfxW2EJWaiiAkOcTvr+5d3lhrTNpOJhf8j0KY7O4g4elROayXd12tAxhmy0LpdDEaEAx
	KE6kkLAlSYjhoiQt7JgiVVR7HVmk7LpZfHJkADFw43bpubTA74bBdnsxdD6x5APwNMKD
	SRZFtIQyb4WsNUrFXe1IxuDadf1udUjBO6eV1EyMF5jJQ4PXn1UvgsuQ6j2DF7IuDvZt
	9ODoc9C0bhGVyxdMSpQjRBuKpzVyH+Q17CiMBsVKlf1pvXH0Ok8QmJvhfIlDfZ4di4Gl
	VrIA==
Received: by 10.205.120.134 with SMTP id fy6mr7620495bkc.18.1349851315108;
	Tue, 09 Oct 2012 23:41:55 -0700 (PDT)
Received: from [172.29.23.6] (pd95cb146.dip0.t-ipconnect.de. [217.92.177.70])
	by mx.google.com with ESMTPS id e3sm141814bks.7.2012.10.09.23.41.53
	(version=SSLv3 cipher=OTHER); Tue, 09 Oct 2012 23:41:54 -0700 (PDT)
Message-ID: <507518B0.4040504@dresearch-fe.de>
Date: Wed, 10 Oct 2012 08:41:52 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <CAMKF1soS0oBnwSUGVcJ1csgNGFdjPLY9qxW0-sZMr52TB=wOxw@mail.gmail.com>
	<cover.1349772344.git.sledz@dresearch-fe.de>
	<20121009144235.GD16530@bill-the-cat>
In-Reply-To: <20121009144235.GD16530@bill-the-cat>
X-Enigmail-Version: 1.4.4
X-Gm-Message-State: ALoCoQl/lF62C0NxnR06zhOgRML8GPLBhaIR6OUIZ1Jdap4tvzLAmvsUQLB/2ruyhv6Q6Q3IrXC0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/1] pull request 20121009
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
X-List-Received-Date: Wed, 10 Oct 2012 06:55:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 09.10.2012 16:42, Tom Rini wrote:
> On Tue, Oct 09, 2012 at 10:49:06AM +0200, Steffen Sledz wrote:
> 
>> Hi Tom,
>> 
>> please pull this commit which fixes a build problem on build hosts with newer libXrender installations.
>> 
>> Thx, Steffen
>> 
>> The following changes since commit a35ceaacb2019750dc9f4b4fd5ea927cf2ad47fb:
>> 
>> gdk-pixbuf: add missing dependencies (2012-09-14 15:07:04 -0700)
>> 
>> are available in the git repository at:
>> 
>> git://github.com/sledz/oe pull-request-3 https://github.com/sledz/oe/tree/pull-request-3
>> 
>> Steffen Sledz (1): pango-native: add libxrender-native to dependencies
>> 
>> recipes/pango/pango.inc |    4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Applied to 2011.03-maintenance, thanks!

Something went wrong. The patch isn't in the 2011.03-maintenance branch. :(

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


