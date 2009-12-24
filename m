Received: from mail-px0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNjp8-0004i6-7a
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 10:17:37 +0100
Received: by pxi12 with SMTP id 12so4173076pxi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 01:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:subject:date:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=BA/hYUXxR1+fjitLWPOPq8oORrntcNEBWlgSSaUY4XA=;
	b=Bi0wKbWb+Axz+4rPsPdCpW9II5L9nn+8Mgfl/FE1ez7zzGsXvlf1TG+i1E5cx7CTI0
	omWrxq38dByrug99yKRex9QsyOJAvvVD3ZWNOBDThK+YYlSRDdqo24f8Ixxmx7ZLfaap
	AKRcVsJqnV7x8gDaWT0AmyZQz07nFtdrV1Mzo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:subject:date:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=wnOEFCWpED0q66O7hBjZOk7WpR652PbtlgWyAWHgg1dAQPKdDFPrND2EKXJCXeveG0
	R0F74gNHSj8jUD5tiZvTitYi6pBe48vZdUmUDrjhCdXjlavxZWJFD6c+mbvEBVrPQmtA
	5lKNPBrsVEMIhFBR5k9+6F5IrnL2oF5Gn0g1o=
Received: by 10.142.3.32 with SMTP id 32mr7602443wfc.214.1261646139823;
	Thu, 24 Dec 2009 01:15:39 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.101])
	by mx.google.com with ESMTPS id 20sm7623256pzk.13.2009.12.24.01.15.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 01:15:39 -0800 (PST)
Date: Thu, 24 Dec 2009 17:15:33 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5fqn7fimn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: auto report bug onto bugzilla when building failure
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
X-List-Received-Date: Thu, 24 Dec 2009 09:17:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys?
   I found seppuku.bbclass and have some question about it.

1. Is it used to report building bug onto bugzilla automatically?
2. If so, anyone can give me some hint about how to use it?
3. will the bugzilla it reports automatically be related with  
http://tinderbox.openembedded.net/?

Thanks a lot!

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


