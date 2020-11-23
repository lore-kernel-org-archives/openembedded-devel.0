Received: from mail.teq.ch (mail.teq.ch [195.65.128.4])
 by mx.groups.io with SMTP id smtpd.web12.33117.1606127411227617250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 02:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: teq.ch, ip: 195.65.128.4, mailfrom: e.boccati@teq.ch)
X-Virus-Scanned: amavisd-new at teq.ch
X-Sender: e.boccati
Subject: Re: [oe] [meta-java] [zeus] cacao ERROR 404
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembedded-devel@lists.openembedded.org
References: <3ec4be3d-509d-8325-a2f9-76ab01d4c6da@teq.ch>
 <0f808cdf-c294-99f7-2f33-814f065fbf6d@teq.ch>
 <20201123100623.GA2341@brokenbit>
From: "Eric Boccati" <e.boccati@teq.ch>
Message-ID: <1f14f44f-75de-8086-c244-2d6bf23e1fac@teq.ch>
Date: Mon, 23 Nov 2020 11:30:03 +0100
MIME-Version: 1.0
In-Reply-To: <20201123100623.GA2341@brokenbit>
X-Antivirus: Avast (VPS 201122-4, 11/22/2020), Outbound message
X-Antivirus-Status: Clean
X-Groupsio-MsgNum: 88061
Content-Type: multipart/alternative;
 boundary="------------F734E807377B3211E503D22D"
Content-Language: it

--------------F734E807377B3211E503D22D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I figured out the problem pulling changes from last commit of master=20
branch, i will submit a patch when i finish test on it.


EB


/Electronics that lead the way/

*Eric BOCCATI*
Software Designer

Tel +41 91 911 77 00

TEQ SA - Via al Municipio 16 - 6917 Lugano - Barbengo - Switzerland
www.teq-automotive.com <http://www.teq-automotive.com>


*/Multiplex - Dashboards - ITS - Fleet Management - Gas Sensors -=20
Advanced Driver Assistance Systems - Remote Diagnostics/ ***
Il 11/23/2020 11:06 AM, Richard Leitner ha scritto:
> Hi Eric,
>
> On Thu, Nov 19, 2020 at 02:33:49PM +0100, Eric Boccati wrote:
>> Hi,
>>
>> im trying to build jre using your meta-java pulling it from last commi=
t of
>> zeus branch but cacao fetch fail:
> The zeus branch for meta-java isn't maintained anymore. Please update t=
o
> dunfell, gatesgarth or master.
>
> If you need to stick with zeus please feel free to send a patch
> adressing the issue.
> A good starting point would be commit 00cb61f (cacao: update to latest
> git version, 2020-08-20) =F0=9F=98=89
>
> regards;rl
>
>> I tried to move recipe from meta-java rocko (our previous/working bran=
ch)
>> but it stuck on:
>>
>>
>>

--------------F734E807377B3211E503D22D
Content-Type: multipart/related;
 boundary="------------477F5FE40A16418ED08DF00A"

--------------477F5FE40A16418ED08DF00A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Richard,<br>
    </p>
    <p>I figured out the problem pulling changes from last commit of
      master branch, i will submit a patch when i finish test on it.</p>
    <p><br>
    </p>
    <p>EB<br>
    </p>
    <div class=3D"moz-signature">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <font style=3D"font-size:1pt" face=3D"Calibri,sans-serif"> <img
          style=3D"margin:0;padding:0"
          src=3D"cid:part1.C9EC531E.8935DB45@teq.ch" alt=3D""> <br>
        <font style=3D"font-size:10pt" face=3D"Calibri,sans-serif"> <i><s=
pan
              style=3D"font-size:8pt">Electronics that lead the way</span=
></i>
          <br>
          <br>
          <b>Eric BOCCATI</b> <br>
          Software Designer <br>
          <br>
          Tel +41 91 911 77 00 <br>
          <br>
          TEQ SA - Via al Municipio 16 - 6917 Lugano - Barbengo -
          Switzerland <br>
          <a href=3D"http://www.teq-automotive.com">www.teq-automotive.co=
m</a>
          <br>
          <br>
          <img src=3D"cid:part3.51E7B5C1.B823648F@teq.ch" alt=3D""> <br>
          <b><i><span style=3D"color:rgb(86,168,208)">Multiplex -
                Dashboards - ITS - Fleet Management - Gas Sensors -
                Advanced Driver Assistance Systems - Remote Diagnostics</=
span></i>
          </b></font><b> </b></font></div>
    <div class=3D"moz-cite-prefix">Il 11/23/2020 11:06 AM, Richard Leitne=
r
      ha scritto:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20201123100623.GA2341@brokenbit=
">
      <pre class=3D"moz-quote-pre" wrap=3D"">Hi Eric,

On Thu, Nov 19, 2020 at 02:33:49PM +0100, Eric Boccati wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Hi,

im trying to build jre using your meta-java pulling it from last commit o=
f
zeus branch but cacao fetch fail:
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
The zeus branch for meta-java isn't maintained anymore. Please update to
dunfell, gatesgarth or master.

If you need to stick with zeus please feel free to send a patch
adressing the issue.
A good starting point would be commit 00cb61f (cacao: update to latest
git version, 2020-08-20) =F0=9F=98=89

regards;rl

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
I tried to move recipe from meta-java rocko (our previous/working branch)
but it stuck on:



</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------477F5FE40A16418ED08DF00A
Content-Type: image/png;
 name="cdlmfahieilkdnec.png"
Content-Transfer-Encoding: base64
Content-ID: <part1.C9EC531E.8935DB45@teq.ch>
Content-Disposition: inline;
 filename="cdlmfahieilkdnec.png"

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
RK5CYII=

--------------477F5FE40A16418ED08DF00A
Content-Type: image/png;
 name="cfjohpfokjgbflii.png"
Content-Transfer-Encoding: base64
Content-ID: <part3.51E7B5C1.B823648F@teq.ch>
Content-Disposition: inline;
 filename="cfjohpfokjgbflii.png"

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

--------------477F5FE40A16418ED08DF00A--

--------------F734E807377B3211E503D22D--
