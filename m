Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1STuAZ-00040a-0f
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 May 2012 14:14:31 +0200
Received: by lbol5 with SMTP id l5so3220256lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 May 2012 05:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=UTIxh7/2VatxpR+1VBLDSaaB3pBOQKwUQTlXiekJ+xk=;
	b=F7F/X9ZNC/j0e0WGIRpRYKkJprgAmYv+HuchhBw5cBli+gZNBCX5nGAY1ULzyd5Qm9
	aazXxi3Yszn7I5JsP0zMd4NfinwWewtCV8S9TVQ37tKbHBHsonu3kZ+Jnrrob80a/Zzg
	2PFO+a1zzX+rCN+pT82/Z0HzM5YDxlOGPmTjFH+yeUbOqcw778KqE/8DPcsLT4O2VV42
	Dn+Ln8tMnwV8NFGudOGK+v8YIMgvRa+MxTsm9oQpSzS3tabhvaEpImRmkK/j+natuSmF
	mnc9TfCmnbRwVKaTPqBA4ZcimdIJHhKrWgRTto/Ink7/E1xhWu5gCFEwq8UpCefRINkf
	Vzfw==
Received: by 10.152.106.9 with SMTP id gq9mr7976000lab.14.1336997072178;
	Mon, 14 May 2012 05:04:32 -0700 (PDT)
Received: from [192.168.0.121] ([84.49.231.147])
	by mx.google.com with ESMTPS id gi19sm2554583lab.16.2012.05.14.05.04.30
	(version=SSLv3 cipher=OTHER); Mon, 14 May 2012 05:04:31 -0700 (PDT)
Message-ID: <4FB0F450.7050404@gmail.com>
Date: Mon, 14 May 2012 14:02:24 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: License attributions for a system built with OpenEmbedded.
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
X-List-Received-Date: Mon, 14 May 2012 12:14:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi.

I have made a rootfs and an SDK with OE-classic. We use the SDK to
compile our own application, which links dynamically with some open
source libraries.

I have listed the LGPL libraries our application uses and linked to
http://www.gnu.org/licenses/lgpl.txt, but I don't know how/if to
attribute OpenEmbedded. Should I include attributions for every single
open source software in the rootfs+SDK, or is it sufficient to say that
I have compiled them using OpenEmbedded?

- Tasslehoff



