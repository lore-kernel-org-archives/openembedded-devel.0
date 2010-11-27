Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PMOpP-0004pm-9H
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 18:44:51 +0100
Received: by iwn8 with SMTP id 8so1185847iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Nov 2010 09:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=2WVvvpNxBo6epjkysD7YaJN0VcqCuWRpDyIrhGBGwXU=;
	b=OzOosZOE2597DXeFT3ye+sjZt4G+uqM8PhPz/bFaaQCcPX51+kPOViVvB/16CaoZz8
	+UG7W44BlGB0m1/jMFmUGtUbx++Ys9NBZMT04OTTg0j33/wwa5DtIKSFWdlmeKOVI+LR
	UIp3sI2xbACIsOhrqtnpWypPv2SfP38e8BAmc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=afsXmOMVZY19HJZ4J7ok/dv7f7L/FrRje51YA7yEPFcA8S0z/PiNB0MX34svyPEArI
	MdV6xBqhMtMAeSv0+A0AO96lGuIwFll5cmdLcMxpX3To4r5NfjtGjO2Go6upmT8aTHI7
	h0I30BAacyZ26mUeAnELMQUL3XFOSPZoFmK30=
MIME-Version: 1.0
Received: by 10.231.15.136 with SMTP id k8mr3162703iba.51.1290879814961; Sat,
	27 Nov 2010 09:43:34 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Sat, 27 Nov 2010 09:43:34 -0800 (PST)
Date: Sat, 27 Nov 2010 18:43:34 +0100
Message-ID: <AANLkTin4u=yb+3U32jcYjhgzYEhtXa9FwRr3xBJ7JE3K@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Klaus Schwarzkopf 's patches
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
X-List-Received-Date: Sat, 27 Nov 2010 17:44:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Can someone pick this up and push these (probably after testing).
They all seem quite OK to me, but as patchwork is not functioning at
the moment I cannot easily apply them (getting patches from gmail is a
little bit of a pain wrt spaces andl linebreaks if you read the mail
from internet).

Frans


