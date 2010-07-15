Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <df6.626@gmail.com>) id 1OZHho-0005wW-BH
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 08:14:01 +0200
Received: by ewy7 with SMTP id 7so130461ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jul 2010 23:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=tsRZMNTKF7zJIWPbdrHh/ui0BEuQ3tVGOf0W6jtGnrs=;
	b=PBUZVBzMIOuAtSht+7oMM/7AfeIIfTY4XsH7xkiMnBgCSLViSwYIiHiY1Shx65vRSz
	Sr+n3+IJ6X4XSrvxg7/GUi4g/VKGP+VZMTajGVVrTnN4luXrgYiHLd2EbMYSKbdVrjDP
	kgDAGciT4vfWEesAmbojOyMU0gsPxWiqZr5pQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=VbAkVvaHGAWxOg5l04tJVIT96xEwf/AlVaczKOVGlZsF+quNYYpPygpBV/s4KtCjdT
	AgJm/PGmziKGFVH9ZAD+ghxGOM8+fR7urFpb6W7mEHqfnIbhOok4vDWy9UINH9fjMdTZ
	wgg1zZNRQATeMM0oiK32ywAzcWxoT0HYTakMc=
Received: by 10.213.22.201 with SMTP id o9mr2402748ebb.6.1279174438086;
	Wed, 14 Jul 2010 23:13:58 -0700 (PDT)
Received: from [192.168.1.142] ([94.180.19.127])
	by mx.google.com with ESMTPS id v8sm5151815eeh.14.2010.07.14.23.13.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 14 Jul 2010 23:13:57 -0700 (PDT)
Message-ID: <4C3EA720.1080804@gmail.com>
Date: Thu, 15 Jul 2010 12:13:52 +0600
From: Dmitry Vinokurov <df6.626@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100528 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: df6.626@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Specific distro defconfig for all busybox versions
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
X-List-Received-Date: Thu, 15 Jul 2010 06:14:01 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

Is there a way to set defconfig for specific distribution that will 
apply to all versions of busybox? Now when new busybox version appear, I 
should move <distro_name> directory from one busybox-${PV} to another 
and it's not very convenient. Or maybe I missed something.

-- 
Best Regards,
Dmitry Vinokurov
+7 905 862 17 11
<df6.626@gmail.com>



