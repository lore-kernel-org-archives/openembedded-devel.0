Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rodrigo.vivi@gmail.com>) id 1KlUri-0003gk-4n
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Oct 2008 22:33:38 +0200
Received: by an-out-0708.google.com with SMTP id b38so68529ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Oct 2008 13:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=x3mlbkiLxtcDJhsfWwZmh+Lnes2b57gzEoZroHe7dV8=;
	b=EuIJxc7xrDYrGywNkA06VxwIjVh0TONUBp/50SxNYl5gga9grFkHIoSkADTjV/BHpd
	WO1zGa1QeXsG+wXQntjD+WpOHsRNVJ31jHcFrF0WKsxtzfyGs6c3SVx/FLQc+FXMoMSt
	9Nk8eC1SzSwN7NByJNoo6Ic/qF+/PX5MtvMQE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=OAiWZTKGpogPOMOQSCElIMFZ2E+4JE8GdXrlfnPDkiRPevX1w/268WPXT/wCvlnWa0
	RHfwhdzKyqtRTmW1zFjYzuZtP5XgnxJ3jCSgucvK5FVd8EvdfeJd5yjqk8kn1I1Ockdr
	91i/k+vs2MrfkOJ6RPozXAIpp8FkKTfIMr8Ng=
Received: by 10.100.208.7 with SMTP id f7mr148237ang.77.1222979364621;
	Thu, 02 Oct 2008 13:29:24 -0700 (PDT)
Received: by 10.65.220.3 with HTTP; Thu, 2 Oct 2008 13:29:24 -0700 (PDT)
Message-ID: <bdb0025f0810021329w571d30cdmcce2e192f7bd6205@mail.gmail.com>
Date: Thu, 2 Oct 2008 17:29:24 -0300
From: "Rodrigo Vivi" <rodrigo.vivi@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48E50DB6.90603@fundem.net>
MIME-Version: 1.0
References: <48E36C18.4090504@smartlink.ee> <gc017m$gq4$1@ger.gmane.org>
	<48E4082D.9030000@whitby.id.au> <200810020243.50896.zecke@selfish.org>
	<48E50DB6.90603@fundem.net>
Subject: Re: I'm sick of that Was Re: git master not updating
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
X-List-Received-Date: Thu, 02 Oct 2008 20:33:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Holger,

I know that your intention with this email wasn't receive an avalanche
of "Thank you".
However I must say Thank you!

The work that you've spent on that has made our lives easier. It was
so pain work with monotone.

I know that we from Mamona are not working properly with OE, but we
are waiting the complete git migration to work closer to OE and send
our fixes and improvements back upstream.

So I'd like to ask you: Please don't give up!

Is there any thing that I can do to help you?

Best Regards,
vivijim

On Thu, Oct 2, 2008 at 3:06 PM, Mark Vels <Mark.Vels@fundem.net> wrote:
> Holger Freyther wrote:
>> - I wrote mtn2git because I felt like, no one ever said thank you
>> - I run mtn2git on the OE metadata on a server provided by a company
> that has
>> nothing todo with OpenEmbedded
>> - I maintain the running of the script over a GPRS line with a couple of
>> seconds delay, no one ever said thank you.
>>
>> Instead I _always_ get complains for a service I do for the community
> that was
>> announced as "experimental and might vanish every day". I'm sick of this
>> attitude. I will discontinue this service as of now.
>>
>> z.
>>
> Thank you!
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Rodrigo Vivi
INdT - Instituto Nokia de Tecnologia
Blog: http://blog.vivi.eng.br
GPG: 0x905BE242 @ wwwkeys.pgp.net


