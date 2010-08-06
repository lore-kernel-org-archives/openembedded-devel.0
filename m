Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OhTJH-0000Ek-92
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 22:14:34 +0200
Received: by bwz8 with SMTP id 8so208496bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 13:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=MWAdJEMrZWHOH8lM6v3ZEc3cHBSD5yMU9GUlZzGW0Sw=;
	b=xfBoHyCeYRKl6EfZ4iouj9ygYCQoKXr4i7jIjWV+Pu51Id+p2KsoG56BMz4H8lppUl
	FpLFNl0C5+OckpmIbRdiw9wANN+vRxnMT6aFELUcXvKanRVVZTcHfg5uS4JpKc3sq8eB
	YxKHWFqYBrfX33H0Wfp33YHyeENOebSVEHoH4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=e69srjFNkvDMw/lPuNVwS2XQREi86V1zOIbeamSgSUZtwN5SheBZYliR0UUzoPvhsU
	A9XnFRHdIyRFDHOePGAHkuBL+wSbZku1jR5aX4s+BspcBT8JitG95IXbIpxR8Uj+Gw9O
	GGOHt6qznv5nGFm3sa/8nZSmjlCkVK4bYfUEU=
MIME-Version: 1.0
Received: by 10.204.81.215 with SMTP id y23mr7999852bkk.78.1281125647561; Fri, 
	06 Aug 2010 13:14:07 -0700 (PDT)
Received: by 10.204.21.6 with HTTP; Fri, 6 Aug 2010 13:14:07 -0700 (PDT)
Date: Fri, 6 Aug 2010 22:14:07 +0200
Message-ID: <AANLkTimDF5zZ-F3-GDe_OUJv3nFKD+YGn4_7xWYuEatc@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] openocd-native_svn.bb
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
X-List-Received-Date: Fri, 06 Aug 2010 20:14:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, I bumped upon openocd-native_svn.bb and I was wondering why we have that.
No-one seems to depend on it.
Do we want our own openocd instead of the one that is on the host?
Or should this be removed?

Frans


