Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Opiw1-0000gZ-AK
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 16:32:39 +0200
Received: by wwb31 with SMTP id 31so5459856wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=gdmk3rUavwOxzAqFeQepA9/bYHIL/XGExQWnkFQCZxk=;
	b=M+cYoLjt3H0Saxl06yfK1MGGbQgoEkK+eWyfRA/JaRMduDvGHdtsJZJOA6AyD31o3e
	77yl4Xzhuk5EQd0hiOEF120oZeCufu87ewg9IDMzuOCeQ1KMJiJHXs8x3IQXTsKsgXiG
	1uqHovCKkSQLvGwXsW1F8U/GX3BoyyDDlhvcE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=OeWeTvOkQP/g3/kUo7jMtHigJ29nyheoTLeGM6gk+JbHuo78bR0Y4SDoNefdqOhT4B
	+hiu3ao8r420XmyL5dSpqIzDc+VOpTxmPbmUZIOwUtVpdpDyX1hUFZAe1CPecZNrxyJl
	BJUQSsQbsDImw/qdusK5By2c0uO8ulwEx9KtM=
MIME-Version: 1.0
Received: by 10.227.132.129 with SMTP id b1mr3606089wbt.5.1283092326364; Sun,
	29 Aug 2010 07:32:06 -0700 (PDT)
Received: by 10.227.142.79 with HTTP; Sun, 29 Aug 2010 07:32:06 -0700 (PDT)
Date: Sun, 29 Aug 2010 16:32:06 +0200
Message-ID: <AANLkTikqOjKcJGArouoVst7BxVE+82_VyZ8hS+KqcCD6@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gcc-4.3.3 DEPENDS on gettext
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
X-List-Received-Date: Sun, 29 Aug 2010 14:32:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

can others review their logs for similar messages on GCC:

NOTE: Gettext required but not in DEPENDS for file
/home/leon/sandbox/ccm/topha/openembedded/tmp/work/ppce500v2-angstrom-linux-gnuspe/gcc-cross-initial-4.3.3-r16.1/gcc-4.3.3/intl/configure.ac.
Missing inherit gettext?


Regards,
-- 
Leon


