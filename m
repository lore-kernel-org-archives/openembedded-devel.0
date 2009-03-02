Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1LeBBS-0004ty-0J
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Mar 2009 17:40:32 +0100
Received: by bwz9 with SMTP id 9so2037636bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2009 08:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=QA4xzWjeqN+ZI9gGSYeCJZOfDBZCfe9RhCSf+obPIOw=;
	b=IY81FMxkq86JiLf4Q8ATD+007hgQ+BP7nIl1wPUjvD5NZBLXAHSJ2nrOs9rsEgnGfA
	qUGOlVxpqC/dFwFTnetH+Jvor3PdJ2Zu3o8vL+5YutdBJzwl61bDTAjbfPP/E5T3wrS8
	wSBmhaIo8il2MV+4aKYG10RFc0LIdFSB50two=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gUpZlVkI4WE8pYO8JVdQELXBrt0nIQOE4lPVYSdqdYvHEvu2N/S4RbTkSLteUTbY0S
	bTRcEoaONk6N+f9VwBZnj+cqC4zM7D3unb0DHJT0Pacxrcbgd9rKc/HsIlS/y1Iq+aFL
	SVBKSZnjJBSGfUlhD+OQHDli9lmsSKsWSEEV4=
MIME-Version: 1.0
Received: by 10.103.217.5 with SMTP id u5mr3016688muq.118.1236011764815; Mon, 
	02 Mar 2009 08:36:04 -0800 (PST)
In-Reply-To: <1235900139.5901.4.camel@ubuntu2>
References: <1235734652.7210.12.camel@ubuntu2>
	<20090227184707.GA6027@denix.org> <1235900139.5901.4.camel@ubuntu2>
Date: Mon, 2 Mar 2009 21:36:04 +0500
Message-ID: <1fea892d0903020836u352b9cb3ld15f6e5609581b4a@mail.gmail.com>
From: Anatoly Shipitsin <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Bootloader problems
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
X-List-Received-Date: Mon, 02 Mar 2009 16:40:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, Mar 1, 2009 at 14:35, Paolo Cremonese <pisa.t@teledata-i.com> wrote:

> How can I check points 2 and 1?

1. You CF should be primary master in BIOS.
2. Check .config file from kernel source tree.

