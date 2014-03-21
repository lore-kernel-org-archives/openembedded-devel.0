Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8CB6F9D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 21:08:58 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id oy12so3203557veb.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 14:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=34BjDg1gtGQZKDocD1kdE4FqeScAeQTj2nkmEW9odzk=;
	b=vC1Ur52uX7J+KcOUubjwjZlBtI0AXhCr3GIPmqdOaa6B/jBtEyeZTZp0S/sSQKpAbv
	TieMujRck9rY66zzNO2BMsXdST5q9jJeSA1hDNIdau3ASqIVUzV5dcfds0oMiwG4c2yQ
	SheP0621r3nQiIzhko5Eo52sQ6q44hj18F9nM5bFd72gqEGYsdJEbjYtiryjjg7EotJw
	er3SpTX8ocid4/gP2sgQdJP3KF/ThO4N7C6IQzrgu18zAKkqEq4FTFsntkjhPrMHI3yD
	wnVYF7hJcYFHNIaMM6gmLBmkfsnNm77qXeby51UfF5Q1kWTlF8njfxxskyhTVIDDEDuX
	CQYQ==
MIME-Version: 1.0
X-Received: by 10.58.23.6 with SMTP id i6mr3968994vef.12.1395436139464; Fri,
	21 Mar 2014 14:08:59 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Fri, 21 Mar 2014 14:08:59 -0700 (PDT)
Date: Fri, 21 Mar 2014 14:08:59 -0700
Message-ID: <CAFeBWL6KbMhysVEaXL8aNYdX6pn8BEGOT4hdg9Mnmx1zc4dzSQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: exo build fail on master and master-next
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Mar 2014 21:09:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Good day everyone,
On both master and master-next, I get build fail on exo like below:

configure.ac:112: error: possibly undefined macro: AC_PROG_INTLTOOL

      If this token and others are legitimate, please use m4_pattern_allow.

      See the Autoconf documentation.

autoreconf: /media/Build/master-next/build/tmp/sysroots/x86_64-linux/usr/bin/autoconf
failed with exit status: 1

Full log is here <http://paste.ubuntu.com/7132707/>

Thank you for your help,

Adam

