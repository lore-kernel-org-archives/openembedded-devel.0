Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kg4ysn@gmail.com>) id 1QpLaM-0007TY-7M
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 16:41:14 +0200
Received: by vxj14 with SMTP id 14so1879915vxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2011 07:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4XBstFeVY2tdGkViimkG+4RLh/U4SZZmKpwRjTNT8vA=;
	b=X69UWz0VIwjTgLJiHHfFtIWhidHCk0o/ZHWmREY42zFDVUdSBNywQB0jrIeyTGmvUJ
	ocQWX9d+cbN1ynTNbP4mbM8IT/eoBGDMIA5ikSLkK8FCH/zeElik5KGdccLZTcMUiXoJ
	fsOZYDueIyGWss7F9HoIXFFJJ+fs+xONwA/Sw=
MIME-Version: 1.0
Received: by 10.52.32.68 with SMTP id g4mr2260187vdi.216.1312555009011; Fri,
	05 Aug 2011 07:36:49 -0700 (PDT)
Received: by 10.220.192.8 with HTTP; Fri, 5 Aug 2011 07:36:48 -0700 (PDT)
In-Reply-To: <4E3AA37F.4050100@nedap.com>
References: <1312464763-4063-1-git-send-email-kg4ysn@gmail.com>
	<4E3AA37F.4050100@nedap.com>
Date: Fri, 5 Aug 2011 07:36:48 -0700
Message-ID: <CAG4_upSn8Zu-2VGcv7ZodPZE1krMPLfREC5VoSQsXgvP+ujutA@mail.gmail.com>
From: Chris Verges <kg4ysn@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] ptpd: added recipe for v1.1.0.
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
X-List-Received-Date: Fri, 05 Aug 2011 14:41:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> Why not jump to version 2.1.0 right away...


My project has a need for 1.1.0, so I bumped to that for now.  I also
haven't verified the build process to see if 2.x builds the same as 1.x.

Thanks,
Chris

