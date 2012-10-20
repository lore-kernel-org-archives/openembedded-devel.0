Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TPXfd-0008Jq-Ry
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Oct 2012 13:56:50 +0200
Received: by mail-da0-f47.google.com with SMTP id s35so554364dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Oct 2012 04:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Ex8lPhBQR8k6jfpa7dpx5OBxWlgbwOISnT1/dsTKhT0=;
	b=pHJIYE3/VMVqp64ibmsE+o3QuNbSioOFqkkT57n5lsF44kMj9rex6tVZTrzf0k5z9i
	CD4DxiLz+PwI2qeNEOu0CYUrfSjw4PaDCuJBzddlgM9qLCo/jhoTxJN7NEjP2hcNZuO5
	u28rYhQ+3WQ1WniNK6XVJiBC/7qKkqA8FMZixjKb3M0feMD4FnF5DaAAWOlRPfZLe5eE
	mSKD1+LEs3FFPq7vGCp1Pf3a7KSwlcBnhjRMYyA4fduhJDfxykJGtr5eRWrjayOtsG2z
	KG488u9LLhPIU1Xdjuj7t+GQTTMWH50dkrrx6Xf2guHe4HRix/s2EXA/OHc+gHT+B1qv
	dlJQ==
MIME-Version: 1.0
Received: by 10.66.75.73 with SMTP id a9mr11926511paw.43.1350733407163; Sat,
	20 Oct 2012 04:43:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sat, 20 Oct 2012 04:43:27 -0700 (PDT)
In-Reply-To: <1350679091-5909-2-git-send-email-morgan.little@windriver.com>
References: <1350679091-5909-1-git-send-email-morgan.little@windriver.com>
	<1350679091-5909-2-git-send-email-morgan.little@windriver.com>
Date: Sat, 20 Oct 2012 08:43:27 -0300
X-Google-Sender-Auth: tESxjajC_QryC2n87clQVbz9i6o
Message-ID: <CAP9ODKpDGrupdSS=680GDomMOij0qzRNez3zV+rGst8XTgvvLw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-networking][PATCH 1/3] ntp: Move from meta-oe to meta-networking
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
X-List-Received-Date: Sat, 20 Oct 2012 11:56:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 19, 2012 at 5:38 PM, Morgan Little
<morgan.little@windriver.com> wrote:
> Signed-off-by: Morgan Little <morgan.little@windriver.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


