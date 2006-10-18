Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GaI7X-0003dK-0N for openembedded-devel@lists.openembedded.org;
	Wed, 18 Oct 2006 22:34:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 283BACDE;
	Wed, 18 Oct 2006 22:27:36 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 08630-04; Wed, 18 Oct 2006 22:27:32 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id 3D4E3CDC;
	Wed, 18 Oct 2006 22:27:32 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Diego Municio <dmunicio@gmail.com>
In-Reply-To: <262223130610160133s51eeea80k819793d7f141ce7f@mail.gmail.com>
References: <AcbgdPkAHP4dlY5cSUiFjMaSV5PieQ==>
	<2A29FD26542C3F4895D9B9370CB2828702D47553@DB-Exchange01.DataBalk.local>
	<262223130610160133s51eeea80k819793d7f141ce7f@mail.gmail.com>
Organization: VanilleMedia
Date: Wed, 18 Oct 2006 22:27:32 +0200
Message-Id: <1161203252.1649.111.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Segmentation fault before main
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Oct 2006 20:34:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

oe@handhelds.org is no longer the right mailing list. Please adjust
addresses

Am Montag, den 16.10.2006, 10:33 +0200 schrieb Diego Municio:
> I changed glibc version.. and it worked. It seems to be something
> about pthreads..
> 
> Good luck
> 
> 2006/9/25, Koert Gielen <K.Gielen@databalk.nl>:
>         Hi,
>         
>         Have you been able to solve this problem?
>         
>         We have the same problem on Red Hat AS 4 (update 4). Sqlplus
>         is calling _sysctl and exits with a SIGSEGV.
>         
>         Regards,
>         
>         Koert
>         
>         
>         
>         _______________________________________________
>         Oe mailing list
>         Oe@handhelds.org
>         https://www.handhelds.org/mailman/listinfo/oe
>         
>         
> 
> _______________________________________________
> Oe mailing list
> Oe@handhelds.org
> https://www.handhelds.org/mailman/listinfo/oe
-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




