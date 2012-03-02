Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S3Vaf-0000fz-8V
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2012 17:44:21 +0100
Received: by wera1 with SMTP id a1so1220691wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2012 08:35:50 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.107.2 as permitted sender)
	client-ip=10.180.107.2; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.107.2 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.107.2])
	by 10.180.107.2 with SMTP id gy2mr7001965wib.12.1330706150414 (num_hops
	= 1); Fri, 02 Mar 2012 08:35:50 -0800 (PST)
Received: by 10.180.107.2 with SMTP id gy2mr5606310wib.12.1330706150345;
	Fri, 02 Mar 2012 08:35:50 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm4627323wiy.7.2012.03.02.08.35.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Mar 2012 08:35:49 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F50F2C9.5000407@mlbassoc.com>
Date: Fri, 2 Mar 2012 17:35:47 +0100
Message-Id: <C46426C7-428A-429F-B5B3-DEE03C557EEB@dominion.thruhere.net>
References: <4F50F2C9.5000407@mlbassoc.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkqQHFTKmROWGLHOzegtxmglferBDXoQjRke/pKtN7P3WG1ec4Ay8NUfd8+7ErANYTY7mM4
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [Angstrom-devel] Why can't I build firefox?
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
X-List-Received-Date: Fri, 02 Mar 2012 16:44:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 2 mrt. 2012, om 17:18 heeft Gary Thomas het volgende geschreven:

> I'd like to test firefox on my BeagleBone using my latest Angstrom
> setup, so I added the meta-mozilla layer to my layers & now have this

Angstrom includes meta-mozilla by default, so it looks like you don't =
actually have an angstrom setup. FWIW, an up to date firefox is in the =
feeds for at least armv7a.=


