Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rv6e7-00071z-UZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 13:29:12 +0100
Received: by werc1 with SMTP id c1so319445wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 04:21:08 -0800 (PST)
Received: by 10.216.139.79 with SMTP id b57mr6777977wej.22.1328703668722;
	Wed, 08 Feb 2012 04:21:08 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id cb8sm39398122wib.0.2012.02.08.04.21.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 04:21:07 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1440338.tNHdM1mVy9@helios>
Date: Wed, 8 Feb 2012 13:21:00 +0100
Message-Id: <D1070E92-4B5C-407D-A445-A8657ADFCD3A@dominion.thruhere.net>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKp7S2+HR3umrnd9RzT5JE0X_T_cjWPzi6S5WUdZ-SAzoQ@mail.gmail.com>
	<jgtov9$fhv$1@dough.gmane.org> <1440338.tNHdM1mVy9@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQnWibpVvqd0tly5EUJcSF4dEnr8YQ7U3PgNdYwx/rRl28nyXHSfD1TuVl7lF5Klfz9L+rRo
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Wed, 08 Feb 2012 12:29:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 8 feb. 2012, om 13:18 heeft Paul Eggleton het volgende geschreven:

> On Wednesday 08 February 2012 13:14:27 Koen Kooi wrote:
>> Images with sysvinit will be working the same as before, just with
>> libsystemd-logind.so.X being installed.
> 
> Just out of interest, how large is that file?

On my ext4 fs:

root@beagleboneA3-0457:~# du  /lib/libsystemd-login.so.0.1.1 -hs
34K     /lib/libsystemd-login.so.0.1.1

regards,

Koen


