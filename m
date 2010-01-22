Received: from mail-yw0-f195.google.com ([209.85.211.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYFgV-0007Ne-4l
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 10:20:10 +0100
Received: by ywh33 with SMTP id 33so887182ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 01:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=vKL6jBzkl/7GzAGQn26PW7MYiSv3DxGhY6WpBnoesjE=;
	b=iYUHbQxuXV7RUqy3NraiQMCDpxfCvrHgxrjJvrguNd32AwHE1y5AtCCQtYpeofdg1B
	xClXjf7Dd+7ymlmp0/q642iXOqUUWpiPbw2phwn4LcGFKeaMxzWo8C5xs0Sx+NlLajVV
	HSViLCqOp7Dh7I5Ne6U6H030fILlTs/N3yMGk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=FuhKtqZU1yFxUbzhtXALz3QkZWLvYJP3MCaTkVQWTiQiZ6VKOEtPIw4xDsE1ua0lde
	e2WUwiy8SKyO8oCX9D+rBbM8HsvXw9oiW0oSLz/XjNKkCa75cl+1l3Q68DgxHcCWIPwP
	hZ0JPeqXnAqMRXyA37vRgZcSrdngZwcbKW/84=
Received: by 10.91.55.26 with SMTP id h26mr2493038agk.83.1264151869078;
	Fri, 22 Jan 2010 01:17:49 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 22sm735927ywh.30.2010.01.22.01.17.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Jan 2010 01:17:48 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1264150556-8147-1-git-send-email-camelguo@gmail.com>
	<201001221005.57787.marcin@juszkiewicz.com.pl>
Date: Fri, 22 Jan 2010 17:17:39 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6xf3pximn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001221005.57787.marcin@juszkiewicz.com.pl>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.195
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Fix a bug of COMPATIBLE_HOST defination in linux-sun4cdm_*.bb
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
X-List-Received-Date: Fri, 22 Jan 2010 09:20:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

sorry, I forget to add -s option

=E5=9C=A8 Fri, 22 Jan 2010 17:05:57 +0800=EF=BC=8CMarcin Juszkiewicz  =

<marcin@juszkiewicz.com.pl> =E5=86=99=E9=81=93:

> Dnia pi=C4=85tek, 22 stycznia 2010 o 09:55:56 Guo Hongruan napisa=C5=82=
(a):
>> * Correct the defination of COMPATIBLE_HOST in linux-sun4cdm_2.4.26.b=
b  =

>> and
>>  linux-sun4cdm_2.6.8.1.bb, the previous defination causes linux-sun4c=
dm
>>  never been selected.
>
> Next time please read commit policy. I pushed that change.
>
> Regards,


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


