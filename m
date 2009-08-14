Received: from [209.85.222.193] (helo=mail-pz0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mc4wi-0003k1-OG
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Aug 2009 00:08:25 +0200
Received: by pzk31 with SMTP id 31so1307348pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 14:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=UUfJhfX95xzGelR0SKzpFXkoo1qj8DGYA6I1cu2IPgY=;
	b=ZrkTzm/253HgLtfX0MIQtrvVJkSJp5rRGB8iH8xbIZPQ6t9etmupQtYe7JT8r1atPQ
	6qrVawCkZr1rSjSYmIkg5FjuEk6gg8BMa/26E8Qv5TlSNMB8Q4/hQIzlriAaJhl6VXiM
	riUxqu+7LFd5lJtPbizjKYhgrW6x05sTNt34g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=d/YZA0H3+89BvLBzDB5lvSHvU9F7T8E0TPM4DE5vbwd+K6+D5V5D29MZQZO/JfAriq
	v37rErbd6YWOUb1P9O5OQgwPcJ9xQ/hXdHs1WGvt5ayImSbTnb5KTT54TdJw0LRaSpDK
	jGnZFNrR2PLj6U7HB8UbPXj9ZyCpKX4Gim4U8=
Received: by 10.114.37.6 with SMTP id k6mr2225095wak.221.1250286702261;
	Fri, 14 Aug 2009 14:51:42 -0700 (PDT)
Received: from gmail.com (adsl-71-146-8-242.dsl.pltn13.sbcglobal.net
	[71.146.8.242])
	by mx.google.com with ESMTPS id j34sm2915298waf.26.2009.08.14.14.51.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 14 Aug 2009 14:51:40 -0700 (PDT)
Date: Fri, 14 Aug 2009 14:51:38 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090814215138.GB31011@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Subject: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Fri, 14 Aug 2009 22:08:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

I would like to add minimal-eglibc and micro-eglibc distros on same
lines as -uclibc one's

Any objections ?

Thanks

-Khem



