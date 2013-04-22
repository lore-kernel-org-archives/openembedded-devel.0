Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UUOCJ-0003qb-HP
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Apr 2013 23:22:54 +0200
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 314DCA6294;
	Mon, 22 Apr 2013 23:05:07 +0200 (CEST)
Date: Mon, 22 Apr 2013 23:05:06 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130422230506.3bcae5b2@e6520eb>
In-Reply-To: <CAP9ODKraNHQ1cwW8Q+aqqDJ1ChSg+5dqoPNe=dA=TZNALu-4kQ@mail.gmail.com>
References: <CAP9ODKraNHQ1cwW8Q+aqqDJ1ChSg+5dqoPNe=dA=TZNALu-4kQ@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [for-danny] Changes for backporting
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
X-List-Received-Date: Mon, 22 Apr 2013 21:22:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

Le Fri, 19 Apr 2013 10:54:25 -0300,
Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :
> * 1bceff8 libgsf: update to version 1.14.26
> * b2aa32e goffice: update to version 0.10.1

both these patches where hand edited because of tab/space mix following
45830a39bb47a9eab27980d52966226c9504ea4 please check that the result in
danny-next is still OK on your target.

Eric


