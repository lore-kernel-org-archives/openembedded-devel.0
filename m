Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PARG1-00059A-Bj
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 19:54:53 +0200
Received: by gyg13 with SMTP id 13so2337400gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=50WyN2by8a0BKY9VYIX0xVruvlUALGOYW26bEfoocQg=;
	b=iaErZm/zAiu6yAQaE3SN49cbN5SMNn7stoj1lSp4EITsJom2Olly++GsE1jq4Z/dbt
	j9Sxq2BMc/ay9DepRSCMhZMYzcZx/mLb4Hi3QuD3MfbsovcIgd9mJl3oL8yke1vf7tSs
	jz9BQ6LCqjvVUxWrEm9XpYEdKJoYstYQdPWDc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Aj8kP4wolBF67PSjWoTJTABg0DGc7vaR4m0dyczxeuTbj9tJCDDue/PwBc7GOaTNQa
	IVwgrlj7phS7zy/kh3qtuDyFdkiF1iJWFprbPbuavvR6I44tc1AinZKeAAep+FBzTVh1
	zgGHkz80h1QQXMvYBixu3God0Ei1wRFYmt410=
MIME-Version: 1.0
Received: by 10.150.159.13 with SMTP id h13mr3173082ybe.409.1288029251737;
	Mon, 25 Oct 2010 10:54:11 -0700 (PDT)
Received: by 10.151.98.13 with HTTP; Mon, 25 Oct 2010 10:54:11 -0700 (PDT)
In-Reply-To: <1288011441-23308-1-git-send-email-obi@opendreambox.org>
References: <4CC5778F.7060004@opendreambox.org>
	<1288011441-23308-1-git-send-email-obi@opendreambox.org>
Date: Mon, 25 Oct 2010 19:54:11 +0200
Message-ID: <AANLkTinfzW+EExA=m9kBvM+azfCtg3P4F8L-eyWdm1Jr@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] libdvdnav: add recipe for version 4.1.3-7 from debian
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
X-List-Received-Date: Mon, 25 Oct 2010 17:54:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

pushed several of your patches.
Please make sure your patches do not have whitespace errors
got a few of these:
/home/frans/oe/openembedded/.git/rebase-apply/patch:54: trailing whitespace.

/home/frans/oe/openembedded/.git/rebase-apply/patch:59: space before
tab in indent.
 	cd $(srcdir) &&  \

Frans


