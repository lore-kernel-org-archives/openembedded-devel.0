Received: from [209.85.219.20] (helo=mail-ew0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LDcz5-0002Z0-UF
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 11:53:31 +0100
Received: by ewy13 with SMTP id 13so928508ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2008 02:48:50 -0800 (PST)
Received: by 10.210.67.4 with SMTP id p4mr3548697eba.150.1229683730359;
	Fri, 19 Dec 2008 02:48:50 -0800 (PST)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id t2sm2830127gve.19.2008.12.19.02.48.49
	(version=SSLv3 cipher=RC4-MD5); Fri, 19 Dec 2008 02:48:49 -0800 (PST)
Message-ID: <494B7C10.8090407@xora.org.uk>
Date: Fri, 19 Dec 2008 10:48:48 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.18 (X11/20081125)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20081218071901.GB2135@buddha.tw.openmoko.com>	<20081218150517.GI2135@buddha.tw.openmoko.com>	<gidpuk$29d$1@ger.gmane.org>	<1229619255.9166.66.camel@mill.internal.reciva.com>	<gie3e0$6th$1@ger.gmane.org>
	<20081219053858.GQ2135@buddha.tw.openmoko.com>
In-Reply-To: <20081219053858.GQ2135@buddha.tw.openmoko.com>
X-Enigmail-Version: 0.95.0
Subject: Re: openmoko-merges
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
X-List-Received-Date: Fri, 19 Dec 2008 10:53:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

John Lee wrote:
> I'll keep working on the fastboot branch (need the help of original
> author on this one.  since this will become general changes, it's not
> going to be easy), and reorganize the om-merge branch a bit.  Is this
> the first time of such a big merge ?  I think Graeme and I both did
> some merge back before, but this one seems to be bigger...
>
>   
I used to use a process similar to what koen suggested where I would
only merge back into OE the final changes to a .bb not all the
mistakes/fuckups/typos that got us to that result. Then evaluate each
change on its own to judge its level of controversy.

Graeme



