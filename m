Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1O7rPO-0005ok-CM
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 16:41:38 +0200
Received: by bwz20 with SMTP id 20so167995bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 07:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=V3mO+UwL3bvtUeTtR6BITWx4WEbq++dYaxHpWd04AMg=;
	b=QZzIljAqn/4RRxzL6T8llHsz7MyWaHxdaMqldG6nlGR1cxvIglPmc+I9r1WPHWiQMH
	S+LB+o1MomfI9573Z8xgmUBN/yTrZFjLHSHxzvHBRXLI5WOnQdJEJ+lpJiV9M0qdhVLF
	JbZzfBDUvxkKHpTmYR4TgByPjKKVnwMsJJO4o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=SRmQEmZsWOSrgJglP+BeN6ixZ9JG9wWO3Tr8MkdZIH190sn3wPMe43DPZ7qmtB0Nz1
	cwEF4M0albSkKPm9iLNb1ddysxOm4wbSX4/Nfqxzmi/Eeq5VRc9vWYHPvnio2GZ7tlHA
	/stbaLZzGrFA7uE/He3sceD3Qf7Y+p/+SnT2c=
Received: by 10.204.131.153 with SMTP id x25mr1151140bks.159.1272638273844;
	Fri, 30 Apr 2010 07:37:53 -0700 (PDT)
Received: from [192.168.178.21] (85-127-151-70.dynamic.xdsl-line.inode.at
	[85.127.151.70])
	by mx.google.com with ESMTPS id 15sm718758bwz.8.2010.04.30.07.37.52
	(version=SSLv3 cipher=RC4-MD5); Fri, 30 Apr 2010 07:37:52 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1272552574.3865.814.camel@trini-m4400>
References: <hrbmd4$mng$1@dough.gmane.org>
	<1272552574.3865.814.camel@trini-m4400>
Date: Fri, 30 Apr 2010 16:38:29 +0200
Message-ID: <1272638309.6803.1.camel@becca>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.0.1 
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Merging RPs branch, help needed for dealing with possible fall-out
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
X-List-Received-Date: Fri, 30 Apr 2010 14:41:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 29.04.2010, 07:49 -0700 schrieb Tom Rini:
> On Thu, 2010-04-29 at 12:18 +0200, Koen Kooi wrote:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> > 
> > Hi,
> > 
> > I've been talking to RP and we both like to merge his branch as soon as
> > the last problem (the cross lamanger) has been addressed. RP estimates
> > that will happen early next week.
> > But after it has been merged there might be some fallout, which we would
> > like to have some help with. If you don't want to help out and and don't
> > want the possible breakage: don't git pull for the time being.
> 
> Related, do we have people signing up for building ___ targets?  I'll
> assume angstrom + beagleboard + beagleboard-demo will be covered :)
> 

I can do Angstrom + IGEPv2 + console/minimal/x11-image



