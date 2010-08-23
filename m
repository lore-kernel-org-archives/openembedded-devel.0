Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Ongre-0006UE-Bc
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 01:55:43 +0200
Received: by wyb33 with SMTP id 33so7013314wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 16:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=mudZKnTe9bScw80lapfB0UESmKZfmJ7veU3eLk+C45A=;
	b=xK2h8GiEUCWrlc+fLcCpcolKirhlKsJm0oT33oH4D9kAPb7xvkDk273UMDw3AEJ4r6
	uqZSNTzhmc7Tg4seu+2ZiEPE5BUEIJPX8HV1n6qr0/eS5RcGWWmcxsMEI5zIFVGl6Oza
	oOwJfA4a7sgYB1j9VwwPnFbVlsvSJmYTnaaz4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BUhUALgiKLBWZ4jIhc3UmYElAmI1mw4SuGhpovfdw9nTck/dVI94R9jW4xMiQ/aPEY
	dnzVIgqKPOGwehkRtRu9UmUmvCpMzqRx+q915PqeqMgMWggXYVee/6Ye4c7MMJfZ8c+x
	3/PwzY3EGvZdcjzxhsGCuaWLlRiGEOH540QEs=
MIME-Version: 1.0
Received: by 10.227.129.12 with SMTP id m12mr5331293wbs.102.1282607714861;
	Mon, 23 Aug 2010 16:55:14 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Mon, 23 Aug 2010 16:55:14 -0700 (PDT)
In-Reply-To: <AANLkTi=UpiaG4DnKT2UdZwnv+isUsLwk0rTL7tZuYi6r@mail.gmail.com>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<AANLkTi=bCxyXU+mubbmFcrtUsHiVsmtsDw0235E69XRd@mail.gmail.com>
	<1282556402.3853.17.camel@mattotaupa>
	<AANLkTimWTfusnW2REvKOhH+vnjS=4EFrKV5DvDNOoYo5@mail.gmail.com>
	<1282601926.3775.10.camel@mattotaupa>
	<AANLkTi=UpiaG4DnKT2UdZwnv+isUsLwk0rTL7tZuYi6r@mail.gmail.com>
Date: Mon, 23 Aug 2010 16:55:14 -0700
Message-ID: <AANLkTimwzK-jFCqQVqMdb+mB0vLJpMmKOA3EjamAM9oD@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Mon, 23 Aug 2010 23:55:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Great write up AJ once again I wasnt even aware of some of those
steps. Probably why a patch I tried to send in a long while ago never
showed up again nor did I hear anything. Thanks for taking the time to
write out those steps and very clearly, hope to see more on your blog
as well about all this. I hope I will get the hang of all this soon,
but I still cant get programs I want to build using BB.



On Mon, Aug 23, 2010 at 4:20 PM, AJ ONeal <coolaj86@gmail.com> wrote:
>>
>> > > Please also remember to update the patch queue [2].
>> > >
>> >
>> > Update it to what?
>> >
>> > That link you gave me is very unclear
>> >
>> > It is desirable to update the state of the patch in the patch queue. T=
his
>> > > could also be added to the script.
>>
>> This sentence addresses the case when your patch is accepted.
>>
>
> I already marked the first two as superseded
>
>
>> > The patch is listed as "new". I'd agree with that state. It certainly
>> isn't
>> > "accepted" - that's someone else's job to put that, right?
>>
>> Reading the reviews your patch got you need to improve it a little bit.
>> So after you send in the next iteration of your patch =96 v2 in our case=
 =96
>> you should update the state to superseded.
>>
>
> If you look at the newest patch I already implemented all of those change=
s
> excepting that I didn't do the Signed-off-by and the patch includes the [=
v2]
> in the commit message.
>
> Do you still want me to submit again with just those changes?
>
>>> All I do to add that is --signoff, correct?
>
>> No. Please take a look at the link I gave you [1] and the other patches
>> sent to this list.
>
> Again, I don't think that's very clear
>
> - Include a Signed-off-by: line indicating the change has valid certifica=
te
>
> of origin as per the Linux kernel
>
>
> What is a valid certificate of origin?
>
> How about an example? You correct me where I'm mistaken and then I'll cop=
y
> this to the wiki as reference
>
>
>
>
> Let's say you create a new recipe and you'd like to submit it for inclusi=
on
> (and you've already tested that it works, of course).
>
> Now commit with a good strong helpful message
>
> =A0 =A0git add recipes/nodejs/
> =A0 =A0git commit # don't use the -m option
>
> The message should look like this
>
> =A0 =A0added recipe for node.js
>
> =A0 =A0* added recipe for node.js (bug #5555 - no nodejs recipe)
> =A0 =A0** patched libev's wscript to not try to execute code
> =A0 =A0** patched node's wscript to not search in '/usr/include'
>
> =A0 =A0Signed-off-by: AJ ONeal <coolaj86@gmail.com>
>
> Create your patch
>
> =A0 =A0git format-patch -1 # or however many commits are part of this cha=
nge
>
> If you are submitting a second version also add "--subject-prefix [v2]"
>
> =A0 =A0git send-email
>
> Your patch will be immediately visible on
> http://patchwork.openembedded.org/patch/
> Once your patch has been accepted or rejected, update the status to
> "accepted" or "rejected"
>
> If you get soft-rejected (a lot of feedback), make the changes, submit th=
e
> next version, and update the status of the previous patch to "superseded"
>
> Appendix: Properly configuring git (using tekkub@gmail.com as an example
> user)
>
> =A0 =A0sudo apt-get install git-core git-email
> =A0 =A0git config --global user.name "Tekkub"
> =A0 =A0git config --global user.email "tekkub@gmail.com"
> =A0 =A0git config --global sendemail.smtpserver smtp.gmail.com
> =A0 =A0git config --global sendemail.smtpserverport 587
> =A0 =A0git config --global sendemail.smtpencryption tls
> =A0 =A0git config --global sendemail.smtpuser tekkupl@gmail.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


