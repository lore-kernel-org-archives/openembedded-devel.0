Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UYF3H-0006as-0K
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 May 2013 14:25:28 +0200
Received: by mail-oa0-f44.google.com with SMTP id h1so1545157oag.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 May 2013 05:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=orWRjArhizFJ2SZ9dIynyZn8LPPRcjUydF2uSCCRb/I=;
	b=ywuXY7FpvKRHr1B0I+6+FQw5S5lrAurOziR52xUMdN7VzZMQ6K0A7xlW7DSI8/Zyvh
	6bytP/2LPn7NWBQnLaX0w7IajFl6oOPl5y/XAUr57ESPbsjU74yQEG1rgvcj9wRV+UFW
	1ogzJy2/XJuzMr6CXH5BqOiymgWa2asQGaqj+vW6FVHKUq4V7AQ/DltjcuexYWS1o/QI
	D2E7k4Ns247VClgED1Sh/4JyFPFvxgIRz7uLaFA0ZHJ2B4tsH2i3xHZfIaLNJlgllqfL
	VcgPH2kTDb18fLkMX2rcObdgFMuILzu1B1W3ZMDpJnZQFGGsyOP2T0HHkNcJDxlsXOvA
	t1Sw==
MIME-Version: 1.0
X-Received: by 10.60.97.4 with SMTP id dw4mr2905599oeb.75.1367582851234; Fri,
	03 May 2013 05:07:31 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Fri, 3 May 2013 05:07:31 -0700 (PDT)
In-Reply-To: <1367578619-19890-3-git-send-email-schnitzeltony@googlemail.com>
References: <1367578619-19890-1-git-send-email-schnitzeltony@googlemail.com>
	<1367578619-19890-3-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 3 May 2013 09:07:31 -0300
X-Google-Sender-Auth: 2hpzNPL-pHQWl6ibNwZrhJoa9SI
Message-ID: <CAP9ODKpdxj3rcu3ABA7XZWEJgZZwe9oEyhb21Bvk7e8U=1r=yQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe/master 2/3] orbit2: update to latest stable / fix build with glib 2.36
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
X-List-Received-Date: Fri, 03 May 2013 12:25:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2013 at 7:56 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> license change of FSF address only
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>

Your commit log is not accurate when comparing with the code.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


