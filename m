Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1JvHHg-0006cE-ND
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 May 2008 21:32:37 +0200
Received: by an-out-0708.google.com with SMTP id b38so417360ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2008 12:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=/aXp2iMOi6N6CHEt75Ft3UoERq4GED1YehiahsQ4XXo=;
	b=W8tIQmIZsmbP3WllKOV+vpRGD5gDEvyTIadBeqApzJa4sJtBEB8ek/RNKprYcTnVNoBzOh4ImQ5LwmqLk/dYizzIqmCmN0ejdGU+3/u/WfeYFMHsqZHuehWFNp3iW/6WBp8uNerG2xOp0gE3QQwEUgOjZDM+DuOMJ/3/MimKxzM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=d0HM0muI2VTRDS1ZEvEdNKls/TqeZBjJ8PEHOhUQ1SPlxRy9R3p2lXmnnz+IsCizVDXzaPL1ReRjoFjspoTxj7lng5M2Tv44mf63JiUlDhIIYoSlcCGSJcXKaTpdGBFT89Q03Hqo7PakH0qasVu88n13VxPYfdcC1Vs4gzfMXt4=
Received: by 10.100.121.12 with SMTP id t12mr7573084anc.154.1210534287287;
	Sun, 11 May 2008 12:31:27 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sun, 11 May 2008 12:31:27 -0700 (PDT)
Message-ID: <c384c5ea0805111231s3590a8d9rfb0bb06c0466686d@mail.gmail.com>
Date: Sun, 11 May 2008 21:31:27 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48262D56.7060401@kernelconcepts.de>
MIME-Version: 1.0
References: <fvpr9t$4vh$1@ger.gmane.org> <fvq5c7$alo$1@ger.gmane.org>
	<fvrtn6$93p$1@ger.gmane.org> <fvs0bo$h8r$1@ger.gmane.org>
	<fvs8g9$de9$1@ger.gmane.org> <4821B0B5.6060701@balister.org>
	<48262D56.7060401@kernelconcepts.de>
Subject: Re: bp flag added to bug tracker (org.openembedded.stable)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sun, 11 May 2008 19:32:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Sun, May 11, 2008 at 1:18 AM, Florian Boor
<florian.boor@kernelconcepts.de> wrote:

>  > I would guess that most users of .stable are more focused on their
>  > product work than keeping up with listservs.
>
>  I suppose this is the key problem with .stable. Its quite likely that people
>  will take it, modify it to fit their needs and do not send patches because it
>  takes too much of their precious time.
>
I think the model that works is as follows:

- there are some dev's using (1) and maintaining (2) a stable branch.
A subset of the people reporting the bugs should be able to fix them.
- there are additional users doing the same.

Note that there is a chicken and egg (or catch22) situation, as I
based my work of .dev currently, not having any other choices.

Regards,

Leon.

-- 
Leon


