Received: from [209.85.217.180] (helo=mail-gx0-f180.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LwMvX-0005CV-Ex
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Apr 2009 22:50:47 +0200
Received: by gxk28 with SMTP id 28so3821386gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2009 13:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=HqsXlZ5Hzss/JNaMEzaL7M0PiSG5CYyjpr2jGJNiY3w=;
	b=bi5nD/GhB/Q4Ugp1pfDHzuiO2V7eVbCyp9H3d3GuBGX4k+EBDbFH7vKikpdvVG7tqD
	WaWO7WEoP3jKfO1e6uVmzrSjFf5V5UT9CYVp0vwuBv1efSN2xwlgwUmShJD1PQQnafaA
	B3DfOh7BxIBTY4XLOqN6KZmgqDDEe3wcWkwNM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BYIWsYz4td3+pXhkHdxB6B6xllPVAetEOY794r+jqeHoK5YaIAahbhHjf1kF+Qf0pX
	NxZrJW6haTmNsCSK0/nQ2EFvnnfxPbPV6z2FkPhDzXmm86f0ivgtZaWuZAqlVp1XjrLT
	5WG55xbHgmBAhpitVg4oqMUeqiwpZLrh4/Gck=
MIME-Version: 1.0
Received: by 10.90.120.17 with SMTP id s17mr2696069agc.63.1240346778262; Tue, 
	21 Apr 2009 13:46:18 -0700 (PDT)
In-Reply-To: <1240241104-21935-7-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240241104-21935-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1240241104-21935-7-git-send-email-marcin@juszkiewicz.com.pl>
Date: Tue, 21 Apr 2009 22:46:18 +0200
Message-ID: <c384c5ea0904211346r54de1a2fs517045cc32ae365@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [STABLE][PATCH 1/1] util-linux-ng: Fixed dangling symlinks.
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
X-List-Received-Date: Tue, 21 Apr 2009 20:50:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Acked-by: Leon Woestenberg <leon@sidebranch.com>

Hehe, I cheat.
-- 
Leon


