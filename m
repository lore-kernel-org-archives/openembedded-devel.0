Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M4cYu-0008KJ-Uh
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 May 2009 17:09:33 +0200
Received: by an-out-0708.google.com with SMTP id b6so564703ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 May 2009 08:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=qtutsD3xmtzWNDviCsoXrMyFRwAyJbeup6qaYTWOsls=;
	b=FTXrq2dZauq9O2ns8XkGOfX0uLC2FDow42h7no0u3GqfRYl8kJOI5O5xhHSPbSM0BK
	obE+MlYCTgYxaTlX+/s++Pvi28Ut9NrCLSL5aCOiHeoBZu70ixz/kfhJMUzKBYT+YJRp
	1f5Hs7F18iqxPL4JQu55Lj2vlWIy1LGWrE4Gw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=xfIUSiuN8rR3KHTcEmQHzbZQRoHszR6Tx5XEh7MdV4bElJaD6yp/moSkQ8hSG6MGXS
	nrXDx3h03BJuVnBlKlLXn1JwhS0Zm5zHxzxgjnk9KMaUGpClKFMuvFtixXXVIfXw4fAR
	ntFBqWXJxONRoAlktdvwPw78FVryks31auTKQ=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.58.19 with SMTP id g19mr3255556ana.149.1242313361899; Thu, 
	14 May 2009 08:02:41 -0700 (PDT)
In-Reply-To: <gudtmn$6om$1@ger.gmane.org>
References: <1242152713-31425-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1242152713-31425-2-git-send-email-marcin@juszkiewicz.com.pl>
	<gudtmn$6om$1@ger.gmane.org>
Date: Thu, 14 May 2009 12:02:24 -0300
X-Google-Sender-Auth: 0b161644e907faec
Message-ID: <be7a9f3d0905140802u56c1820cy12cd5ed40428c937@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [STABLE][PATCH 1/2] bitbake: Update to work without warnings with python 2.6
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
X-List-Received-Date: Thu, 14 May 2009 15:09:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


On Wed, May 13, 2009 at 4:43 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 12-05-09 20:25, Marcin Juszkiewicz wrote:
>>
>> From: Richard Purdie<rpurdie@linux.intel.com>
>>
>> Some time ago I fixed BitBake trunk to not generate DeprecationWarnings
>> when used with Python 2.6. Some time later Richard Purdie backported it
>> into bitbake-1.8 branch. Now I tested it with stable/2009 and want to
>> get it inside.
>>
>> Signed-off-by: Richard Purdie<rpurdie@linux.intel.com>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


