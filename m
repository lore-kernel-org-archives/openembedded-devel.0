Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <castroenrico@gmail.com>) id 1M9L7P-0003Vj-8H
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 May 2009 17:32:39 +0200
Received: by bwz19 with SMTP id 19so4676489bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 May 2009 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=ctGq/XxHofsDqZHiTVn3Zh52RWats0OsKCf6QMUrjo0=;
	b=hyHVn50M6B3PpCUWykTgmtjRfcyz3WXQoB1H2zERRSgG4C/4w7GHRh6WfF5S4jfpVy
	/z7kBHPT0XsXBy1E8S/wm6ZXDPYVU2/AfH6qPukB81ep0MZAUMITDh+wx9GWSDjqYeR/
	Y9PZjdycK5Ic18LXnElB73AKcKXTC/sbxufH4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=JlCcXWzELtWo+4rSLllV5tfGOMiSBUd1mHH9pYhebPY2hlbPN3EwfbRe6Ih9v5wCfW
	mVfAwbOTcOmn+G0r18+KhACPlJyQ8vx9wk45tzht+6JKutE1QIEBO/AwibAlpMju4aak
	LPu3rrOAXPwjrpgrzDwjmVgln0zPJUxPYSAKE=
Received: by 10.223.106.15 with SMTP id v15mr193365fao.15.1243437859463;
	Wed, 27 May 2009 08:24:19 -0700 (PDT)
Received: from ubuntu.redarrow (net-93-144-30-123.t2.dsl.vodafone.it
	[93.144.30.123])
	by mx.google.com with ESMTPS id 28sm4000819fkx.54.2009.05.27.08.24.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 May 2009 08:24:17 -0700 (PDT)
Message-ID: <4A1D5B1F.4060608@gmail.com>
Date: Wed, 27 May 2009 17:24:15 +0200
From: Enrico Castro <castroenrico@gmail.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: ti-codec-engine_2.23.bb failed
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
X-List-Received-Date: Wed, 27 May 2009 15:32:39 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

I build ti-codec-engine_2.23.bb, but the source codec_engine_2_23_01.tar.gz did not found in 
www.angstrom-distribution.org

NOTE: Running task 1786 of 5760 (ID: 475, 
/home/enrico/oe/openembedded/recipes/dsplink/ti-codec-engine_2.23.bb, do_fetch)
NOTE: fetch http://install.tarball.in.source.dir/codec_engine_2_23_01.tar.gz
--16:48:23--  http://install.tarball.in.source.dir/codec_engine_2_23_01.tar.gz
            => `/home/enrico/oe/tmp/downloads/codec_engine_2_23_01.tar.gz'
Resolving install.tarball.in.source.dir... failed: Name or service not known.
NOTE: fetch http://www.angstrom-distribution.org/unstable/sources/codec_engine_2_23_01.tar.gz
--16:48:23--  http://www.angstrom-distribution.org/unstable/sources/codec_engine_2_23_01.tar.gz
            => `/home/enrico/oe/tmp/downloads/codec_engine_2_23_01.tar.gz'
Resolving www.angstrom-distribution.org... 85.214.40.226
Connecting to www.angstrom-distribution.org|85.214.40.226|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
16:48:36 ERROR 404: Not Found.

NOTE: Task failed: Fetch failed: http://install.tarball.in.source.dir/codec_engine_2_23_01.tar.gz
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/enrico/oe/openembedded/recipes/dsplink/ti-codec-engine_2.23.bb do_fetch failed
ERROR: Task 475 (/home/enrico/oe/openembedded/recipes/dsplink/ti-codec-engine_2.23.bb, do_fetch) failed
NOTE: Tasks Summary: Attempted 1785 tasks of which 1785 didn't need to be rerun and 1 failed.
ERROR: '/home/enrico/oe/openembedded/recipes/dsplink/ti-codec-engine_2.23.bb' failed

Regards,

Enrico



