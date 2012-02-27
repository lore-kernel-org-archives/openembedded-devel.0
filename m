Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1S1uZ5-0007op-6z
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Feb 2012 08:00:07 +0100
Received: by wgbdr12 with SMTP id dr12so1334457wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2012 22:51:41 -0800 (PST)
Received-SPF: pass (google.com: domain of sledz@dresearch-fe.de designates
	10.180.84.170 as permitted sender) client-ip=10.180.84.170; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sledz@dresearch-fe.de
	designates 10.180.84.170 as permitted sender)
	smtp.mail=sledz@dresearch-fe.de
Received: from mr.google.com ([10.180.84.170])
	by 10.180.84.170 with SMTP id a10mr15622872wiz.9.1330325501421
	(num_hops = 1); Sun, 26 Feb 2012 22:51:41 -0800 (PST)
Received: by 10.180.84.170 with SMTP id a10mr12321002wiz.9.1330325501360;
	Sun, 26 Feb 2012 22:51:41 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id d7sm50767822wiz.6.2012.02.26.22.51.39
	(version=SSLv3 cipher=OTHER); Sun, 26 Feb 2012 22:51:40 -0800 (PST)
Message-ID: <4F4B27FA.3050504@dresearch-fe.de>
Date: Mon, 27 Feb 2012 07:51:38 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
	<562d0d44a950d86ec19d98621d837e4a227db73a.1330097955.git.sledz@dresearch-fe.de>
	<20120224202626.GA14969@bill-the-cat>
In-Reply-To: <20120224202626.GA14969@bill-the-cat>
X-Enigmail-Version: 1.3.5
X-Gm-Message-State: ALoCoQkpXxU1TQHxa7EWeg3pAVR62JSTAxdVkdaotEWdxuG28CsdagtmqDT/nKgEyzMrPh6Cqwqc
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 2/7] fakeroot-native: update to 1.14.5
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
X-List-Received-Date: Mon, 27 Feb 2012 07:00:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.02.2012 21:26, Tom Rini wrote:
> On Fri, Feb 24, 2012 at 04:47:19PM +0100, Steffen Sledz wrote:
> 
>> * version 1.9.6 is no longer fetchable
> 
> It _IS_ fetchable if you use a versioned string on snapshot.debian.org.
> Please use this instead (and we have an example or two already, possibly
> even for fakeroot I'd have sworn).

Hmmmm?

It's a pity that these comments did not came up, when the commits were proposed to oe-classic master some weeks before. Now they made it their way to the master branch (and our application) as they are.

I would prefer if they make it to 2011.03-maintenance the same way to avoid confusions with master branch.

Regards,
Steffen

PS: Can you explain for a non-debian user what you exactly mean with "use a versioned string on snapshot.debian.org". Thx

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


