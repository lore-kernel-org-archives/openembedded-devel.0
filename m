Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NHuwJ-0000xC-Rc
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Dec 2009 08:56:58 +0100
Received: by yxe5 with SMTP id 5so2948593yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 23:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:organization
	:subject:to:mime-version:content-transfer-encoding:from:date
	:message-id:user-agent;
	bh=utO6cKA7G9EXjfuRKAf00div66xZwMGYtXqEnntBSk8=;
	b=NsRmL4YVfGl20BVvGBMtDepn6QM08MO7Uj+d3yZdmuTwK79K5qlxb+XjgG6eKYIUnZ
	DwB1JO0XinQzM6BHgKcnvii+WVRSa4/ZkTajZ4DHk1oCzQwhqMB/mIv+9PEEnbYNDUBA
	ZYpuaV+WnuwEGjreRbNaEsDurf4EfRxyDtLvM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:organization:subject:to:mime-version
	:content-transfer-encoding:from:date:message-id:user-agent;
	b=Dazf0IovOAGI+ntpZNIypBU2tjVh8M0yBmZclQqjHDXeII3ydRhQzpsp3UNtnFtyAc
	1Hwf6ipZdeD7ARWd+mjLFferfk0N4Dq7bZTjTOiE77rBgHWMK81GzTBWpEosFos1VLrm
	mAS5FTdoy2tiKYePEdf9OoDBnL+h5xL+Vyvb0=
Received: by 10.90.19.28 with SMTP id 28mr1242185ags.89.1260258915038;
	Mon, 07 Dec 2009 23:55:15 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.77])
	by mx.google.com with ESMTPS id 20sm3992429iwn.9.2009.12.07.23.55.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 07 Dec 2009 23:55:14 -0800 (PST)
Organization: Gulessoft, Inc
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Date: Tue, 08 Dec 2009 15:55:05 +0800
Message-ID: <op.u4lz932emn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Does it possible to use pre-built native tools
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
X-List-Received-Date: Tue, 08 Dec 2009 07:56:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
      I want to configure openembedded to use the pre-built native tools.
e.g: qemu-native, quilt-native when building the whole image, so that the
building can save lots of time. Is there anyone know how to achieve it?

      Thanks a lot!


-- 
Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


