Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id EA30660E7C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Dec 2013 03:44:24 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id h16so10925557oag.39
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Dec 2013 19:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=E4FArepWZ3//Z8tivHAqzCgnX81byXd6zLkIzdR5RP4=;
	b=Gg2GGouJVSElu+rTm5Z8d1WxsrKG/sT/AEaqiVxqqF3uiOiO8JM+yjLCuwhBjfxaDI
	QZYGlbLB+C9mp0BbCx3zG9giI/ywBsAOaqZw23HMY1S/8ghO9oquX+KulKhlR6SoyqPV
	UtkXWNY2z+LQx7X3cfVOaOzfTYcbdA4eY/xpcgXBKPzgRwZPR36lkGpEHwOBvFxsBV4h
	/ZJ0BxXWQ0tuHjArbbiqsgqJgfgTWJqHqMBsenFwX1u14LTA/c/fk6XQKfrcxpc5yVXX
	Z5TaYqXT5Sqxj2CroSn29eLtyaVeshFWg9drVQESCDfGPkCt6p95pJsa1dlz4ZB4HlGH
	1FDA==
MIME-Version: 1.0
X-Received: by 10.60.233.9 with SMTP id ts9mr10813919oec.65.1388288665325;
	Sat, 28 Dec 2013 19:44:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 28 Dec 2013 19:44:25 -0800 (PST)
In-Reply-To: <l9m4qt$96c$1@ger.gmane.org>
References: <1388121314-6630-1-git-send-email-otavio@ossystems.com.br>
	<l9m4qt$96c$1@ger.gmane.org>
Date: Sun, 29 Dec 2013 01:44:25 -0200
X-Google-Sender-Auth: 1k3IRvHqqffGSe_4qImbORCMe-8
Message-ID: <CAP9ODKokWPh=Cii=fyyDLf0_DRahzVD=1PEY6BS-YmOGfUcL_Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-oe][for-dora 1/3] geos: Update to 3.4.2 and rework the packaging
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
X-List-Received-Date: Sun, 29 Dec 2013 03:44:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Martin,

On Sat, Dec 28, 2013 at 7:15 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> All 3 patches look good to me for going into the dora branch

Can you review those for dora?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

