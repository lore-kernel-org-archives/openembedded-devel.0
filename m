Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id A4D1761222
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 23:29:25 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id w6so1134095lbh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2013 15:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=IJHlhP9gyVLYZSFXlbCmNOGSpzrN747ZYKde2poJ0X8=;
	b=obt7xqLuju1q0L4O9CDVn8hZrRALZHLZLfTLtEZm41mrd5h2VlFhtSLy3REaQyFMKv
	kazREl4SXj1gu3Fm3poTdKAtIjVcd7Pnsh7yDVLOOaO8cPaYkKpJh1yuyApJIRsljxcB
	WtPHIIsNEu1Av8W87EOST0UfE1WodNTTT+7N6Br8C0FqKw2eFJd3i6c55JT1gltPxXF9
	7GdmefpJMgBJtuMwxgXkZ0RKOLAm465qJQYpzK6elbZt5z43tU/m/w9rHCFOwfzf0rJv
	k8jT3YnY1jE9wtngrTcrKlp35vecY4Px8nR/W0A4fkZSuJiBEAoACenML/E+Pnyp/Nr3
	TCNg==
MIME-Version: 1.0
X-Received: by 10.152.180.35 with SMTP id dl3mr1864382lac.66.1387236564111;
	Mon, 16 Dec 2013 15:29:24 -0800 (PST)
Received: by 10.114.97.104 with HTTP; Mon, 16 Dec 2013 15:29:24 -0800 (PST)
In-Reply-To: <1387235789-14596-1-git-send-email-andrea.adami@gmail.com>
References: <1387235789-14596-1-git-send-email-andrea.adami@gmail.com>
Date: Tue, 17 Dec 2013 00:29:24 +0100
Message-ID: <CAAQYJAsreCqN3_OnpokJ7Wo+k232R4LK86c_z7JNTC3DqPhxpw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] klibc: upgrade from 2.0.2 to release 2.0.3
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
X-List-Received-Date: Mon, 16 Dec 2013 23:29:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Patch v2 following, with new git tag...

Andrea

