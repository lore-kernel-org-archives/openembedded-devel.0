Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OZTvd-00024t-GZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 21:17:06 +0200
Received: by gya6 with SMTP id 6so893062gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 12:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=CyZI6YbNbTiWeaR15sD98vpBVU4X+rzvFFGTja5AvUs=;
	b=xhFGYUfV5Z4tqKI5W0tM/5601Nvej2mG4RPnbhiclfbbIS4FJFKlUQ+3RVWUI/tCqw
	zOZltej9mnX4gjG1KbOdKqnhlVc7JE8WyzcKiUT+kMun9lpTKPR//cozoVXzvOi+sDlL
	uSRYkqai0hflOG/QPSsKWD7QxbZu9Cjo0gWx4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=BGbAKzfV76Cy7WzO4hcVbBNLLc4zs161mO5pUUlL4V1LvjvagKWbW5wdHoU8940966
	m+l55CNhJFjyW/9vtVM7m96v2v4nKb/p2uVuzzbnqf3pKxRDjDr27618iWRAUyIg3kSx
	gYhPd8VHYvH5aqqArNXKuzMspAfzJbnBM+Nds=
MIME-Version: 1.0
Received: by 10.101.135.25 with SMTP id m25mr138575ann.58.1279221418210; Thu, 
	15 Jul 2010 12:16:58 -0700 (PDT)
Received: by 10.100.127.11 with HTTP; Thu, 15 Jul 2010 12:16:58 -0700 (PDT)
Date: Thu, 15 Jul 2010 12:16:58 -0700
Message-ID: <AANLkTim0UZEz6vWG0QNTJitmM94QMyXbGHdsDdeM7xhh@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Does anyone have current recepies for some of these programs:
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
X-List-Received-Date: Thu, 15 Jul 2010 19:17:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have not had much luck figuring out how to write my own recipies as
of yet I keep getting different errors for each one that I have yet to
understand. So I am hoping someone might have these already writen.
The platform I am using is a gumstix overo if that makes any
difference.

I am looking for the following:

Ruby 1.9.1
nmap 5.21
kismet from the development source
aircrack-ng preferably from dev source or 1.0 or higher
metasploit 3.4
openssl 1.0+
wireshark from dev source
blueprint
snort 2.8.6

Thanks for anyone sharing any of these recipies if you have them.

 Hopefully soon I can sort out what I am not getting in making a bb
file correctly


