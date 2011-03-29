Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Q4Wwo-0008DO-Oe
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Mar 2011 13:18:54 +0200
Received: by iwn10 with SMTP id 10so57733iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2011 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=wuJ8Tc5m/PctOU1/YoXvP2DiMUwOurCcmYLE28WonzA=;
	b=S7bAi0d2M93ZG7M0b8HKwdkRdh6MaPpQp2Q4goHQBxBitad4l/kkM5AMZKSkA0Hb9G
	UY1z+IcqN7E1f70XVk63gc0Eb574kWh1u4cG75tsksoqh+RwCKXDF+3kV/YIZq26/7SQ
	bL2WOsb+IwsZu2AZeJ+Ydy4Fpgh9YveUi6bOU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Ma0yYWoc7NLzlFDke1/72KZVlKoDgjEo6LgERtKqnhEdxrmVSYSvlSXpYG5XAxitto
	LF0luWp/HEKofIWBEOv7PNMsH/OUpgf1fBiKk2sltTZDqYbLyJq/97RYlrVWsbUBEkP2
	mummX/UKacieszBC09dGgMF2/iilYvLBUywUQ=
MIME-Version: 1.0
Received: by 10.43.44.137 with SMTP id ug9mr9060081icb.175.1301397416601; Tue,
	29 Mar 2011 04:16:56 -0700 (PDT)
Received: by 10.43.131.199 with HTTP; Tue, 29 Mar 2011 04:16:56 -0700 (PDT)
In-Reply-To: <1301354673.6649.10.camel@mattotaupa>
References: <1301348740-30018-1-git-send-email-philippedeswert@gmail.com>
	<1301354673.6649.10.camel@mattotaupa>
Date: Tue, 29 Mar 2011 14:16:56 +0300
Message-ID: <AANLkTi=6hSKs9aJqHEWsYturvxYGaFTxk-jkb5bO6+Rc@mail.gmail.com>
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] eeze: update to 1.0.1
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
X-List-Received-Date: Tue, 29 Mar 2011 11:18:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

On 29/03/2011, Paul Menzel <paulepanter@users.sourceforge.net> wrote:
> Am Dienstag, den 29.03.2011, 00:45 +0300 schrieb phdeswer:
>> * Update to 1.0.1
>
> No need to recite the commit summary, in my opinion.

Well I kind of did because that were the changes and I wanted to make
sure the mail header was correct. Maybe I can skip it next time
indeed.

>> * Contains bugfixes for udev watch/find functions to make sure devices are
>> shown correctly
>
> Since it looks like a minor update, maybe 1.0.0 should be replaced right
> away.

Would be an option.

>> Signed-off-by: phdeswer <philippedeswert@gmail.com>
>
> I think your full name is need here [1]. You can change your Git setup
> using `git config user.name "Philippe Deswert"`.

I just followed the instructions here [1], but I updated my name as
suggested by you. So that should be fine for the next commits.

Thanks for the review!

Philippe

[1] http://www.openembedded.org/index.php/How_to_submit_a_patch_to_OpenEmbedded


