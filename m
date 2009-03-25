Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LmU5p-0001cG-OB
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Mar 2009 15:28:33 +0100
Received: by yx-out-1718.google.com with SMTP id 3so41693yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 07:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=0y8o6sANp/1Q1vrHVeL6XsNoz0zHt17GOwqVJWmUcXk=;
	b=HLkuxgQeN8VuOVapaz2T0RWtk1nCtchKnx8BtAZGa1oHvShm28Ht6GggKODywuW15t
	G5YZB25XxvUFUzBRd65ygsrU27VAJMLPwZp4xjuqQGmMhN/AlAKkzdKvA0rV9ZDYu1bN
	aeoWXBTIjkyHUXqe/ClFdht56N3QpyAfZUr7o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=wQd8W+1A2KGHBq1TGldQyW2sqihZp9cCsQ6vgukMErYcIponfdi/AvflhsXs9RggzF
	HtrVG4da03qDFGU1CudaD/OF6heRrqDtBGJ3zpIP41t0O11A7UY7FiM9QVsK+BYGmaI+
	kpediQO80GIpGg/Qx9AEwjjf8cYV9hcgDQ3Gk=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.197.3 with SMTP id u3mr4354861anf.126.1237991215442; Wed, 
	25 Mar 2009 07:26:55 -0700 (PDT)
In-Reply-To: <1237988215.5328.40.camel@dax.rpnet.com>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<49C93237.7010205@gmail.com> <49C9347C.7010309@balister.org>
	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>
	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>
	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>
	<49C94647.2040401@gmail.com>
	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>
	<gqd31s$5vk$1@ger.gmane.org> <1237988215.5328.40.camel@dax.rpnet.com>
Date: Wed, 25 Mar 2009 11:26:55 -0300
X-Google-Sender-Auth: 36edb24bba711435
Message-ID: <be7a9f3d0903250726w7a4b854aoa1a923ed0ed7eb07@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 14:28:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On Wed, Mar 25, 2009 at 10:36 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

[...]

> * Can we easily create a subset of the metadata which is "maintained"?

[...]

That would be awesome since it could also speed up the building of
the image. Nowadays, the time need to build the cache makes me
fed up! :-)

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


