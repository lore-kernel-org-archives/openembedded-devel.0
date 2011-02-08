Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pmv1b-00060y-QR
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 22:23:03 +0100
Received: by qyk36 with SMTP id 36so4606900qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 13:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=kyoP+gDnQUo14DX2XxMZFQ9Xf0rzoR1KCO2DD2H13dM=;
	b=A60stjAPpghpHig36RM4Pwzbtj8a6mOkaB5+jZMhA7wpdDcDqj4ZWlUSXcle1Y7siP
	Ns0+ud2ZdgjgCvJbOeAjKb6xSnDkk2I2W4zGtgLY3xF8RWV55XnMbeP0/6g6uTgO5mbg
	yPKem1vPRajKGdlqlCsdD1BUmD2nIhBZTJV0g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sWoZ+y9kQ9H8IhLe49xWmq+o5nwnFo4HCf9j3XYFfDMnmAjHLMDmNVqV8Dnl5xvY5R
	rfHkzpb0AENhqc2o9QFb3dXv2x9UuB1DJ/1Ajy9eiVmPo+ACv0biN9NVepvmWuDxU0w4
	JvzLmapy6Sq7P1ZDIEzt4eoP+VA/F6u9oz1bQ=
MIME-Version: 1.0
Received: by 10.229.229.135 with SMTP id ji7mr14208147qcb.229.1297200120908;
	Tue, 08 Feb 2011 13:22:00 -0800 (PST)
Received: by 10.229.68.100 with HTTP; Tue, 8 Feb 2011 13:22:00 -0800 (PST)
In-Reply-To: <iisb4q$n5v$1@dough.gmane.org>
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D517D6C.3070604@mentor.com> <iis1mg$tj9$1@dough.gmane.org>
	<AANLkTim7EfHHu1wCmZOwEtG7uvtURM=fmpjGT9k790Jo@mail.gmail.com>
	<iisb4q$n5v$1@dough.gmane.org>
Date: Tue, 8 Feb 2011 22:22:00 +0100
Message-ID: <AANLkTinwpiJ861xbQN=bX6U4sJXtYDppUxCjh1GFjWzs@mail.gmail.com>
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Tue, 08 Feb 2011 21:23:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2/8/11, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Kinda hard to get to the feeds without networking

True, but couldn't we let the distro maintainers decide about this?

For example we at jlime know that feeds will be fetched via wifi and
we do not need bluetooth in the bootstrap image.

bye,
Filip Zyzniewski


